# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150217094319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "perfect_money_merchant_account_units", force: true do |t|
    t.integer "account_id"
    t.string  "currency"
    t.string  "code_number"
    t.float   "balance"
  end

  add_index "perfect_money_merchant_account_units", ["code_number"], name: "pmmam_cn_unq", unique: true, using: :btree

  create_table "perfect_money_merchant_accounts", force: true do |t|
    t.string "login"
    t.string "password"
    t.string "secret_key"
  end

  add_index "perfect_money_merchant_accounts", ["login"], name: "pmma_l_unq", unique: true, using: :btree
  add_index "perfect_money_merchant_accounts", ["secret_key"], name: "pmma_sk_unq", unique: true, using: :btree

  create_table "perfect_money_merchant_payments", force: true do |t|
    t.string   "payment_batch_num"
    t.string   "payment_id"
    t.string   "payment_amount"
    t.string   "payer_account"
    t.string   "payee_account"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "perfect_money_merchant_payments", ["payment_batch_num"], name: "pmmp_pbn_unq", unique: true, using: :btree

  create_table "user_profiles", force: true do |t|
    t.integer  "user_id",            null: false
    t.string   "first_name"
    t.string   "last_name"
    t.text     "about"
    t.string   "country"
    t.string   "city"
    t.string   "skype"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "vkontakte_id"
    t.string   "facebook_id"
    t.string   "twitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pm_usd_acct"
    t.string   "username"
    t.string   "vk_url"
    t.string   "facebook_url"
    t.string   "odnoklassniki_url"
    t.string   "google_plus_url"
    t.string   "youtube_chanel_url"
  end

  add_index "user_profiles", ["user_id"], name: "user_profiles_user_id_unique", unique: true, using: :btree

  create_table "user_referral_payments", force: true do |t|
    t.integer  "user_id",    null: false
    t.float    "amount",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_vk_contacts_collector_permissions", force: true do |t|
    t.integer  "user_id",                                null: false
    t.string   "package"
    t.datetime "expires_at"
    t.boolean  "can_create",             default: false, null: false
    t.boolean  "can_read",               default: false, null: false
    t.boolean  "can_update",             default: false, null: false
    t.boolean  "can_delete",             default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "requests_limit_per_day", default: 0,     null: false
  end

  create_table "user_vk_contacts_records", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "vcf_file"
    t.string   "xlsx_file"
    t.string   "vk_source_identifier"
    t.integer  "skype_count"
    t.integer  "instagram_count"
    t.integer  "twitter_count"
    t.integer  "phone_count"
    t.integer  "total_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_vk_contacts_records", ["user_id", "name", "vk_source_identifier"], name: "uvcr_ui_n_vsi_u", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               default: false, null: false
    t.integer  "inviter_id"
    t.float    "referral_earned",        default: 0.0,   null: false
    t.float    "referral_paid_out",      default: 0.0,   null: false
    t.float    "referral_award",         default: 0.0,   null: false
    t.float    "referral_award_level_1", default: 0.0,   null: false
    t.float    "referral_award_level_2", default: 0.0,   null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

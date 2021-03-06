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

ActiveRecord::Schema.define(version: 20160302022836) do

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "course_number"
    t.integer  "school_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id"

  create_table "outlines", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "course_id"
    t.integer  "seller_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "price",                   default: "5"
    t.integer  "professor_id"
    t.integer  "sales",                   default: 0
    t.string   "attachment_file_name"
    t.string   "attachment_file_size"
    t.string   "attachment_content_type"
    t.string   "attachment_updated_at"
    t.integer  "school_id"
  end

  add_index "outlines", ["course_id"], name: "index_outlines_on_course_id"
  add_index "outlines", ["seller_id"], name: "index_outlines_on_seller_id"

  create_table "professors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "professors", ["school_id"], name: "index_professors_on_school_id"

  create_table "purchases", force: :cascade do |t|
    t.integer  "buyer_id"
    t.integer  "outline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "price"
  end

  add_index "purchases", ["buyer_id"], name: "index_purchases_on_buyer_id"
  add_index "purchases", ["outline_id"], name: "index_purchases_on_outline_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "school_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "merchant_account"
  end

  add_index "users", ["school_id"], name: "index_users_on_school_id"

end

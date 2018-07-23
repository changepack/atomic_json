require 'test_helper'

class AtomicJsonTest < Minitest::Test

  def setup
    @order = create(:order)
  end

  def teardown
    @order = nil
  end

  # def test_update_jsonb_top_level_string_field
  #   @order.jsonb_update_columns(:data, string_field: 'Hello')
  #   assert_equal 'Hello', @order.reload.data['string_field']
  # end
  #
  # def test_update_jsonb_top_level_int_field
  #   @order.jsonb_update_columns(:data, int_field: 4)
  #   assert_equal 4, @order.reload.data['int_field']
  # end
  #
  # def test_update_jsonb_top_level_date_field
  #   @order.jsonb_update_columns(:data, timestamp: Date.parse('2018/08/12'))
  #   assert_equal '2018-08-12', @order.reload.data['timestamp']
  # end
  #
  # def test_update_jsonb_top_level_time_field
  #   @order.jsonb_update_columns(:data, timestamp: Time.parse('2018/08/12 10:00 UTC'))
  #   assert_equal '2018-08-12T10:00:00Z', @order.reload.data['timestamp']
  # end
  #
  # def test_update_jsonb_top_level_nil_field
  #   @order.jsonb_update_columns(:data, null_field: nil)
  #   assert_nil@order.reload.data['null_field']
  # end

  def test_update_jsonb_top_level_json_field
    @order.jsonb_update_columns(:data, json_field: { another_json: true })
    assert_equal({ another_json: true }.as_json, @order.reload.data['json_field'])
  end

  # def test_update_jsonb_top_level_array_field
  #   @order.jsonb_update_columns(:data, array_field: [10, 12, 'asa'])
  #   assert_equal [10, 12, 'asa'], @order.reload.data['array_field']
  # end
  #
  # def test_update_jsonb_top_level_boolean_field
  #   @order.jsonb_update_columns(:data, boolean_field: false)
  #   assert_equal false, @order.reload.data['boolean_field']
  # end

  # def test_update_jsonb_nested_field
  #   expected_json = {
  #     nested_one: {
  #       nested_two: 'salut!',
  #       nested_four: 'yo',
  #       nested_three: 'hey'
  #     }
  #   }
  #   @order.jsonb_update_columns(:data, nested_field: {
  #     nested_one: {
  #       nested_two: 'salut!'
  #     }
  #   })
  #   assert_equal expected_json.as_json, @order.reload.data['nested_field']
  # end

end

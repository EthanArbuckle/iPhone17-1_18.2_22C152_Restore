@interface MOSuggestionAttachment
+ (BOOL)supportsSecureCoding;
- (MOSuggestionAttachment)initWithCoder:(id)a3;
- (MOSuggestionAttachment)initWithProvider:(id)a3;
- (NSItemProvider)itemProvider;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOSuggestionAttachment

- (MOSuggestionAttachment)initWithProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOSuggestionAttachment;
  v6 = [(MOSuggestionAttachment *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_itemProvider, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestionAttachment encodeWithCoder:]();
  }

  [v4 encodeObject:self->_itemProvider forKey:@"provider"];
}

- (MOSuggestionAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOSuggestionAttachment;
  id v5 = [(MOSuggestionAttachment *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provider"];
    itemProvider = v5->_itemProvider;
    v5->_itemProvider = (NSItemProvider *)v6;
  }
  return v5;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding _itemProvider", v2, v3, v4, v5, v6);
}

@end
@interface TUMetadataItem
- (BOOL)isEmpty;
- (NSMutableDictionary)callMetadata;
- (TUMetadataItem)init;
- (id)description;
- (id)metadataForProvider:(Class)a3;
- (void)setMetadata:(id)a3 forProvider:(Class)a4;
@end

@implementation TUMetadataItem

- (void).cxx_destruct
{
}

- (id)metadataForProvider:(Class)a3
{
  v4 = [(TUMetadataItem *)self callMetadata];
  v5 = NSStringFromClass(a3);
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (NSMutableDictionary)callMetadata
{
  return self->_callMetadata;
}

- (TUMetadataItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUMetadataItem;
  v2 = [(TUMetadataItem *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    callMetadata = v2->_callMetadata;
    v2->_callMetadata = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setMetadata:(id)a3 forProvider:(Class)a4
{
  id v6 = a3;
  id v8 = [(TUMetadataItem *)self callMetadata];
  v7 = NSStringFromClass(a4);
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TUMetadataItem *)self callMetadata];
  id v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (BOOL)isEmpty
{
  v2 = [(TUMetadataItem *)self callMetadata];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

@end
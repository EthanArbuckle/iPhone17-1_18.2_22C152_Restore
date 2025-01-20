@interface MRExternalDeviceMessageMetrics
- (MRExternalDeviceMessageMetrics)initWithPath:(id)a3;
- (void)addMessage:(id)a3 data:(id)a4;
- (void)dealloc;
- (void)write;
@end

@implementation MRExternalDeviceMessageMetrics

- (MRExternalDeviceMessageMetrics)initWithPath:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRExternalDeviceMessageMetrics;
  v5 = [(MRExternalDeviceMessageMetrics *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    entries = v5->_entries;
    v5->_entries = v8;
  }
  return v5;
}

- (void)dealloc
{
  [(MRExternalDeviceMessageMetrics *)self write];
  v3.receiver = self;
  v3.super_class = (Class)MRExternalDeviceMessageMetrics;
  [(MRExternalDeviceMessageMetrics *)&v3 dealloc];
}

- (void)addMessage:(id)a3 data:(id)a4
{
  id v8 = a4;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = [(NSMutableDictionary *)self->_entries objectForKey:v6];
  if (!v7)
  {
    v7 = objc_alloc_init(MRExternalDeviceMessageMetricsEntry);
    [(NSMutableDictionary *)self->_entries setObject:v7 forKey:v6];
  }
  -[MRExternalDeviceMessageMetricsEntry updateWithValue:](v7, "updateWithValue:", [v8 length]);
}

- (void)write
{
  objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 createFileAtPath:self->_path contents:0 attributes:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  entries = self->_entries;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__MRExternalDeviceMessageMetrics_write__block_invoke;
  v7[3] = &unk_1E57D4680;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)entries enumerateKeysAndObjectsUsingBlock:v7];
  [v6 writeToFile:self->_path atomically:1 encoding:4 error:0];
}

void __39__MRExternalDeviceMessageMetrics_write__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [NSString stringWithFormat:@"Type: %@ Entry: %@\n", a2, a3];
  [*(id *)(a1 + 32) appendString:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end
@interface MFIMAPResponseConsumer
- (id)consumersBySection;
- (void)addConsumer:(id)a3 forSection:(id)a4;
- (void)appendData:(id)a3 forSection:(id)a4;
- (void)dealloc;
- (void)done;
@end

@implementation MFIMAPResponseConsumer

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFIMAPResponseConsumer;
  [(MFIMAPResponseConsumer *)&v3 dealloc];
}

- (void)addConsumer:(id)a3 forSection:(id)a4
{
  if (a4) {
    v7 = (__CFString *)a4;
  }
  else {
    v7 = @"<null>";
  }
  consumersBySection = self->_consumersBySection;
  if (!consumersBySection)
  {
    consumersBySection = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_consumersBySection = consumersBySection;
  }
  if ([(NSMutableDictionary *)consumersBySection objectForKey:v7]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 2562, @"should not register multiple consumers for the same section: %@", v7);
  }
  v9 = self->_consumersBySection;
  [(NSMutableDictionary *)v9 setObject:a3 forKey:v7];
}

- (void)appendData:(id)a3 forSection:(id)a4
{
  if (a4) {
    v5 = (__CFString *)a4;
  }
  else {
    v5 = @"<null>";
  }
  v6 = (void *)[(NSMutableDictionary *)self->_consumersBySection objectForKey:v5];
  if (!v6)
  {
    v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[MFIMAPResponseConsumer appendData:forSection:]((uint64_t)v5, v7);
    }
  }
  [v6 appendData:a3];
}

- (id)consumersBySection
{
  return self->_consumersBySection;
}

- (void)done
{
  v2 = (void *)[(NSMutableDictionary *)self->_consumersBySection allValues];
  [v2 makeObjectsPerformSelector:sel_done];
}

- (void)appendData:(uint64_t)a1 forSection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_DEBUG, "server returned data we don't have a consumer for, might be expected for section %@", (uint8_t *)&v2, 0xCu);
}

@end
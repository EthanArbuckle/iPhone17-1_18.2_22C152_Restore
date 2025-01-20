@interface VUIAppDocumentRefreshEvent
- (VUIAppDocumentRefreshEvent)initWithDescriptor:(id)a3;
- (VUIAppDocumentRefreshEvent)initWithRefreshEventDescriptor:(id)a3;
- (id)dictionaryRepresentation;
@end

@implementation VUIAppDocumentRefreshEvent

- (VUIAppDocumentRefreshEvent)initWithDescriptor:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ initializer is not available.", v6 format];

  return 0;
}

- (VUIAppDocumentRefreshEvent)initWithRefreshEventDescriptor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIAppDocumentRefreshEvent;
  return [(VUIAppDocumentUpdateEvent *)&v4 initWithDescriptor:a3];
}

- (id)dictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)VUIAppDocumentRefreshEvent;
  v3 = [(VUIAppDocumentUpdateEvent *)&v11 dictionaryRepresentation];
  objc_super v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(VUIAppDocumentRefreshEvent *)self _refreshEventDescriptor];
  uint64_t v6 = [v5 delayInSeconds];
  v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v7, @"delay");

  v8 = [v5 name];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v8, @"name");
  v9 = (void *)[v4 copy];

  return v9;
}

@end
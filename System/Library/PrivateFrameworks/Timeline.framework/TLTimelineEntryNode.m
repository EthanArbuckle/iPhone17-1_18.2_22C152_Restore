@interface TLTimelineEntryNode
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (TLTimelineEntry)entry;
- (TLTimelineEntryNode)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)leftEntryNode;
- (id)rightEntryNode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEntry:(id)a3;
@end

@implementation TLTimelineEntryNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TLTimelineEntryNode;
  id v4 = a3;
  [(TLTimelineNode *)&v9 encodeWithCoder:v4];
  v5 = [(TLTimelineEntryNode *)self entry];
  [v4 encodeObject:v5 forKey:@"entry"];

  v6 = [(TLTimelineEntryNode *)self entry];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v4 encodeObject:v8 forKey:@"entryClass"];
}

- (TLTimelineEntryNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TLTimelineEntryNode;
  v5 = [(TLTimelineNode *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entryClass"];
    Class v7 = NSClassFromString(v6);
    if ([(objc_class *)v7 conformsToProtocol:&unk_26CE8EC28])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"entry"];
      entry = v5->_entry;
      v5->_entry = (TLTimelineEntry *)v8;
    }
    else
    {
      entry = TLLoggingObjectForDomain(0);
      if (os_log_type_enabled(entry, OS_LOG_TYPE_FAULT)) {
        -[TLTimelineEntryNode initWithCoder:]((uint64_t)v6, entry);
      }
    }
  }
  return v5;
}

- (TLTimelineEntry)entry
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_entry;
  objc_sync_exit(v2);

  return v3;
}

- (void)setEntry:(id)a3
{
  v6 = (TLTimelineEntry *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_entry != v6) {
    objc_storeStrong((id *)&v5->_entry, a3);
  }
  objc_sync_exit(v5);
}

- (NSDate)date
{
  v2 = [(TLTimelineEntryNode *)self entry];
  v3 = objc_msgSend(v2, "tl_entryDate");

  return (NSDate *)v3;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)TLTimelineEntryNode;
  unint64_t v3 = [(TLTimelineNode *)&v8 hash];
  uint64_t v4 = +[TLTimelineEntryNode hash] ^ v3;
  v5 = [(TLTimelineEntryNode *)self entry];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)TLTimelineEntryNode,
        [(TLTimelineNode *)&v9 isEqual:v4]))
  {
    v5 = [(TLTimelineEntryNode *)self entry];
    unint64_t v6 = [v4 entry];
    BOOL v7 = +[TLTimelineUtilities object:v5 isEqualToObject:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)TLTimelineEntryNode;
  id v5 = -[TLTimelineNode copyWithZone:](&v17, sel_copyWithZone_);
  if (v5)
  {
    unint64_t v6 = [(TLTimelineEntryNode *)self entry];
    BOOL v7 = (void *)[v6 copyWithZone:a3];
    [v5 setEntry:v7];

    objc_super v8 = [(TLTimelineEntryNode *)self leftEntryNode];
    objc_super v9 = [v8 entry];
    v10 = (void *)[v9 copyWithZone:a3];

    objc_super v11 = [v5 leftEntryNode];
    [v11 setEntry:v10];

    v12 = [(TLTimelineEntryNode *)self rightEntryNode];
    v13 = [v12 entry];
    v14 = (void *)[v13 copyWithZone:a3];

    v15 = [v5 rightEntryNode];
    [v15 setEntry:v14];
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (id)rightEntryNode
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(TLTimelineNode *)v2 rightNode];
  id v4 = _NodeIfEntryNode(v3);

  objc_sync_exit(v2);
  return v4;
}

- (id)leftEntryNode
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(TLTimelineNode *)v2 leftNode];
  id v4 = _NodeIfEntryNode(v3);

  objc_sync_exit(v2);
  return v4;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21DC44000, a2, OS_LOG_TYPE_FAULT, "Class doesn't conform - %@", (uint8_t *)&v2, 0xCu);
}

@end
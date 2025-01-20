@interface CKInboxSection
- (CKInboxSection)initWithHeader:(id)a3 footer:(id)a4 items:(id)a5;
- (NSArray)items;
- (NSString)footer;
- (NSString)header;
- (NSUUID)identifier;
- (void)setFooter:(id)a3;
- (void)setHeader:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItems:(id)a3;
@end

@implementation CKInboxSection

- (CKInboxSection)initWithHeader:(id)a3 footer:(id)a4 items:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CKInboxSection;
  v11 = [(CKInboxSection *)&v19 init];
  if (v11)
  {
    v12 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    identifier = v11->_identifier;
    v11->_identifier = v12;

    uint64_t v14 = [v8 copy];
    header = v11->_header;
    v11->_header = (NSString *)v14;

    uint64_t v16 = [v9 copy];
    footer = v11->_footer;
    v11->_footer = (NSString *)v16;

    objc_storeStrong((id *)&v11->_items, a5);
  }

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
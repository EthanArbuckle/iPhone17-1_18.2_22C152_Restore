@interface PUCopyEditsSettingSection
- (NSArray)items;
- (NSString)footer;
- (NSString)header;
- (PUCopyEditsSettingSection)initWithItems:(id)a3 header:(id)a4 footer:(id)a5;
- (void)setFooter:(id)a3;
- (void)setHeader:(id)a3;
- (void)setItems:(id)a3;
@end

@implementation PUCopyEditsSettingSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setFooter:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setHeader:(id)a3
{
}

- (NSString)header
{
  return self->_header;
}

- (PUCopyEditsSettingSection)initWithItems:(id)a3 header:(id)a4 footer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PUCopyEditsSettingSection;
  v12 = [(PUCopyEditsSettingSection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_items, a3);
    objc_storeStrong((id *)&v13->_header, a4);
    objc_storeStrong((id *)&v13->_footer, a5);
  }

  return v13;
}

@end
@interface BKDebugViewSection
- (BKDebugViewSection)initWithHeaderTitle:(id)a3 entries:(id)a4 footerTitle:(id)a5;
- (NSArray)entries;
- (NSString)footerTitle;
- (NSString)headerTitle;
@end

@implementation BKDebugViewSection

- (BKDebugViewSection)initWithHeaderTitle:(id)a3 entries:(id)a4 footerTitle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BKDebugViewSection;
  v11 = [(BKDebugViewSection *)&v17 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    headerTitle = v11->_headerTitle;
    v11->_headerTitle = v12;

    objc_storeStrong((id *)&v11->_entries, a4);
    v14 = (NSString *)[v10 copy];
    footerTitle = v11->_footerTitle;
    v11->_footerTitle = v14;
  }
  return v11;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSArray)entries
{
  return self->_entries;
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTitle, 0);
  objc_storeStrong((id *)&self->_entries, 0);

  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
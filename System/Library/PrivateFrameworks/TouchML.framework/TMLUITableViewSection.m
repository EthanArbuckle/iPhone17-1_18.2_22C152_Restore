@interface TMLUITableViewSection
- (NSArray)rows;
- (NSString)footer;
- (NSString)header;
- (id)cellForRow:(int64_t)a3;
- (int64_t)numberOfRows;
- (void)setFooter:(id)a3;
- (void)setHeader:(id)a3;
- (void)setRows:(id)a3;
@end

@implementation TMLUITableViewSection

- (int64_t)numberOfRows
{
  return objc_msgSend_count(self->_rows, a2, v2);
}

- (id)cellForRow:(int64_t)a3
{
  return (id)objc_msgSend_objectAtIndexedSubscript_(self->_rows, a2, v3, a3);
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
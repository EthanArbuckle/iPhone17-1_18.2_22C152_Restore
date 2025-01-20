@interface SDAirDropPreprocessItemsResult
- (BOOL)success;
- (NSArray)files;
- (NSArray)filesToCleanup;
- (NSArray)links;
- (NSArray)otherStuff;
- (void)setFiles:(id)a3;
- (void)setFilesToCleanup:(id)a3;
- (void)setLinks:(id)a3;
- (void)setOtherStuff:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation SDAirDropPreprocessItemsResult

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
}

- (NSArray)otherStuff
{
  return self->_otherStuff;
}

- (void)setOtherStuff:(id)a3
{
}

- (NSArray)filesToCleanup
{
  return self->_filesToCleanup;
}

- (void)setFilesToCleanup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesToCleanup, 0);
  objc_storeStrong((id *)&self->_otherStuff, 0);
  objc_storeStrong((id *)&self->_links, 0);

  objc_storeStrong((id *)&self->_files, 0);
}

@end
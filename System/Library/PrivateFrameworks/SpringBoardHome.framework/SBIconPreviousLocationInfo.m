@interface SBIconPreviousLocationInfo
- (NSString)folderName;
- (SBFolder)folder;
- (void)setFolder:(id)a3;
- (void)setFolderName:(id)a3;
@end

@implementation SBIconPreviousLocationInfo

- (SBFolder)folder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folder);
  return (SBFolder *)WeakRetained;
}

- (void)setFolder:(id)a3
{
}

- (NSString)folderName
{
  return self->_folderName;
}

- (void)setFolderName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_destroyWeak((id *)&self->_folder);
}

@end
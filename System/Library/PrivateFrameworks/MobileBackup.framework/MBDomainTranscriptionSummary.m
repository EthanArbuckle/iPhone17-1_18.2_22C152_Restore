@interface MBDomainTranscriptionSummary
- (BOOL)success;
- (MBDomainTranscriptionSummary)init;
- (unint64_t)deletedFileCount;
- (unint64_t)domainsTransitioningVolumes;
- (unint64_t)emptyDomainCount;
- (unint64_t)modifiedDirectories;
- (unint64_t)modifiedRegularFiles;
- (unint64_t)modifiedSymlinks;
- (unint64_t)reusedAssetRecords;
- (unint64_t)unmodifiedDirectories;
- (unint64_t)unmodifiedRegularFiles;
- (unint64_t)unmodifiedSymlinks;
- (void)setDeletedFileCount:(unint64_t)a3;
- (void)setDomainsTransitioningVolumes:(unint64_t)a3;
- (void)setEmptyDomainCount:(unint64_t)a3;
- (void)setModifiedDirectories:(unint64_t)a3;
- (void)setModifiedRegularFiles:(unint64_t)a3;
- (void)setModifiedSymlinks:(unint64_t)a3;
- (void)setReusedAssetRecords:(unint64_t)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setUnmodifiedDirectories:(unint64_t)a3;
- (void)setUnmodifiedRegularFiles:(unint64_t)a3;
- (void)setUnmodifiedSymlinks:(unint64_t)a3;
@end

@implementation MBDomainTranscriptionSummary

- (MBDomainTranscriptionSummary)init
{
  v3.receiver = self;
  v3.super_class = (Class)MBDomainTranscriptionSummary;
  result = [(MBDomainTranscriptionSummary *)&v3 init];
  if (result)
  {
    result->_success = 0;
    *(_OWORD *)&result->_reusedAssetRecords = 0u;
    *(_OWORD *)&result->_unmodifiedDirectories = 0u;
    *(_OWORD *)&result->_unmodifiedSymlinks = 0u;
    *(_OWORD *)&result->_unmodifiedRegularFiles = 0u;
    *(_OWORD *)&result->_emptyDomainCount = 0u;
  }
  return result;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (unint64_t)reusedAssetRecords
{
  return self->_reusedAssetRecords;
}

- (void)setReusedAssetRecords:(unint64_t)a3
{
  self->_reusedAssetRecords = a3;
}

- (unint64_t)modifiedDirectories
{
  return self->_modifiedDirectories;
}

- (void)setModifiedDirectories:(unint64_t)a3
{
  self->_modifiedDirectories = a3;
}

- (unint64_t)unmodifiedDirectories
{
  return self->_unmodifiedDirectories;
}

- (void)setUnmodifiedDirectories:(unint64_t)a3
{
  self->_unmodifiedDirectories = a3;
}

- (unint64_t)modifiedSymlinks
{
  return self->_modifiedSymlinks;
}

- (void)setModifiedSymlinks:(unint64_t)a3
{
  self->_modifiedSymlinks = a3;
}

- (unint64_t)unmodifiedSymlinks
{
  return self->_unmodifiedSymlinks;
}

- (void)setUnmodifiedSymlinks:(unint64_t)a3
{
  self->_unmodifiedSymlinks = a3;
}

- (unint64_t)modifiedRegularFiles
{
  return self->_modifiedRegularFiles;
}

- (void)setModifiedRegularFiles:(unint64_t)a3
{
  self->_modifiedRegularFiles = a3;
}

- (unint64_t)unmodifiedRegularFiles
{
  return self->_unmodifiedRegularFiles;
}

- (void)setUnmodifiedRegularFiles:(unint64_t)a3
{
  self->_unmodifiedRegularFiles = a3;
}

- (unint64_t)deletedFileCount
{
  return self->_deletedFileCount;
}

- (void)setDeletedFileCount:(unint64_t)a3
{
  self->_deletedFileCount = a3;
}

- (unint64_t)emptyDomainCount
{
  return self->_emptyDomainCount;
}

- (void)setEmptyDomainCount:(unint64_t)a3
{
  self->_emptyDomainCount = a3;
}

- (unint64_t)domainsTransitioningVolumes
{
  return self->_domainsTransitioningVolumes;
}

- (void)setDomainsTransitioningVolumes:(unint64_t)a3
{
  self->_domainsTransitioningVolumes = a3;
}

@end
@interface searchResultItem
- (NSString)path;
- (_LIFileAttributes)liAttr;
- (searchResultItem)init;
- (void)setLiAttr:(_LIFileAttributes *)a3;
- (void)setPath:(id)a3;
@end

@implementation searchResultItem

- (searchResultItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)searchResultItem;
  v2 = [(searchResultItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    path = v2->_path;
    v2->_path = 0;

    *(void *)&v3->_liAttr.fa_int_flags = 0;
    v3->_liAttr.fa_backuptime = 0u;
    v3->_liAttr.fa_addedtime = 0u;
    v3->_liAttr.fa_ctime = 0u;
    v3->_liAttr.fa_birthtime = 0u;
    v3->_liAttr.fa_atime = 0u;
    v3->_liAttr.fa_mtime = 0u;
    *(_OWORD *)&v3->_liAttr.fa_size = 0u;
    *(_OWORD *)&v3->_liAttr.fa_fileid = 0u;
    *(_OWORD *)&v3->_liAttr.fa_seqno = 0u;
    *(_OWORD *)&v3->_liAttr.fa_nlink = 0u;
    *(_OWORD *)&v3->_liAttr.__fa_rsvd0 = 0u;
  }
  return v3;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPath:(id)a3
{
}

- (_LIFileAttributes)liAttr
{
  objc_copyStruct(retstr, &self->_liAttr, 184, 1, 0);
  return result;
}

- (void)setLiAttr:(_LIFileAttributes *)a3
{
}

- (void).cxx_destruct
{
}

@end
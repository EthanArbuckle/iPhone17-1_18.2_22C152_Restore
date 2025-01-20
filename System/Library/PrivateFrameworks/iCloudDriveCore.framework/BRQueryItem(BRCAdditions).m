@interface BRQueryItem(BRCAdditions)
- (id)asFileProviderItem;
- (unint64_t)_isAppLibraryTrashFolder;
@end

@implementation BRQueryItem(BRCAdditions)

- (unint64_t)_isAppLibraryTrashFolder
{
  return ((unint64_t)*(unsigned int *)(a1 + (int)*MEMORY[0x263F326C8]) >> 30) & 1;
}

- (id)asFileProviderItem
{
  if ([a1 isDead]) {
    goto LABEL_6;
  }
  if ([a1 _isAppLibraryTrashFolder]) {
    goto LABEL_6;
  }
  v2 = [a1 creationDate];
  [v2 timeIntervalSince1970];
  char busy = BRCIsBusyDate((uint64_t)v3);

  if ((busy & 1) != 0
    || ([a1 filename],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        !v6))
  {
LABEL_6:
    id v7 = 0;
  }
  else
  {
    id v7 = a1;
  }
  return v7;
}

@end
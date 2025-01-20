@interface SSGetAbbreviationsMDPlistObject
@end

@implementation SSGetAbbreviationsMDPlistObject

void ___SSGetAbbreviationsMDPlistObject_block_invoke()
{
  SSDefaultsGetAssetPath(@"abbreviations.mdplist");
  id v0 = objc_claimAutoreleasedReturnValue();
  v1 = (const char *)[v0 cStringUsingEncoding:4];
  if (v1)
  {
    int v2 = open(v1, 0);
    if (v2 != -1)
    {
      int v3 = v2;
      memset(&v8, 0, sizeof(v8));
      if (!fstat(v2, &v8))
      {
        v4 = mmap(0, v8.st_size, 1, 1, v3, 0);
        if (v4 == (void *)-1) {
          goto LABEL_11;
        }
        v5 = v4;
        _SSGetAbbreviationsMDPlistObject_sAbbreviationsContainer = _MDPlistContainerCreateWithBytes();
        if (_SSGetAbbreviationsMDPlistObject_sAbbreviationsContainer)
        {
          _MDPlistGetRootPlistObjectFromPlist();
          _SSGetAbbreviationsMDPlistObject_rootObj = v6;
          qword_1EA0DE6E0 = v7;
          if (_MDPlistGetPlistObjectType() == 241)
          {
            if (!_SSGetAbbreviationsMDPlistObject_sAbbreviationsContainer) {
              goto LABEL_10;
            }
LABEL_11:
            close(v3);
            goto LABEL_12;
          }
          _SSGetAbbreviationsMDPlistObject_sAbbreviationsContainer = 0;
        }
LABEL_10:
        munmap(v5, v8.st_size);
        goto LABEL_11;
      }
    }
  }
LABEL_12:
}

@end
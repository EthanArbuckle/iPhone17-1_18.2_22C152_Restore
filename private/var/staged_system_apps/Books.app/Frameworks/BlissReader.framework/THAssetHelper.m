@interface THAssetHelper
- (AEAsset)asset;
- (BKLocation)currentLocation;
- (BOOL)canImport;
- (BOOL)coverArtSerializable;
- (BOOL)needsImport;
- (BOOL)purgeAsset;
- (BOOL)purgeCache;
- (NSArray)dirtySyncKeys;
- (NSArray)liteSyncKeys;
- (NSArray)syncKeys;
- (THAssetHelper)initWithBookDescription:(id)a3 bookCoverDescription:(id)a4;
- (id)annotationsInSection:(unint64_t)a3 withType:(int)a4 sortedBy:(int)a5 ascending:(BOOL)a6 range:(_NSRange)a7;
- (id)bookmarks;
- (id)coverArtForSize:(CGSize)a3 source:(int)a4 options:(int)a5;
- (id)genericCoverArtForSize:(CGSize)a3;
- (id)highlights;
- (id)metadataForKey:(id)a3;
- (id)notes;
- (unint64_t)coverArtSources;
- (unint64_t)numberOfAnnotationsInSection:(unint64_t)a3 withType:(int)a4;
- (unint64_t)numberOfSectionsForAnnotations;
- (void)dealloc;
@end

@implementation THAssetHelper

- (THAssetHelper)initWithBookDescription:(id)a3 bookCoverDescription:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THAssetHelper;
  v6 = [(THAssetHelper *)&v8 init];
  if (v6)
  {
    v6->mBookDescription = (THBookDescription *)a3;
    v6->mBookCoverDescription = (THBookCoverDescription *)a4;
  }
  return v6;
}

- (void)dealloc
{
  self->mBookDescription = 0;
  self->mBookCoverDescription = 0;
  v3.receiver = self;
  v3.super_class = (Class)THAssetHelper;
  [(THAssetHelper *)&v3 dealloc];
}

- (AEAsset)asset
{
  result = (AEAsset *)self->mBookDescription;
  if (result) {
    return (AEAsset *)[(AEAsset *)result asset];
  }
  return result;
}

- (BOOL)needsImport
{
  return 0;
}

- (unint64_t)coverArtSources
{
  return [(NSString *)[(THBookCoverDescription *)self->mBookCoverDescription embeddedArtHref] length] != 0;
}

- (id)coverArtForSize:(CGSize)a3 source:(int)a4 options:(int)a5
{
  id result = self->mBookCoverDescription;
  if (result)
  {
    id v7 = [result embededArtURL:a4, a5, a3.width, a3.height];
    id result = +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", [v7 path]);
    if (!result)
    {
      id result = [(THBookCoverDescription *)self->mBookCoverDescription drmContext];
      if (result)
      {
        id result = -[PFDContext dataWithContentsOfFile:error:](-[THBookCoverDescription drmContext](self->mBookCoverDescription, "drmContext"), "dataWithContentsOfFile:error:", [v7 path], 0);
        if (result)
        {
          return +[UIImage imageWithData:result];
        }
      }
    }
  }
  return result;
}

- (id)genericCoverArtForSize:(CGSize)a3
{
  return 0;
}

- (BOOL)canImport
{
  return 1;
}

- (BOOL)coverArtSerializable
{
  return 1;
}

- (BKLocation)currentLocation
{
  return 0;
}

- (id)bookmarks
{
  return 0;
}

- (id)highlights
{
  return 0;
}

- (id)notes
{
  return 0;
}

- (NSArray)syncKeys
{
  return 0;
}

- (NSArray)liteSyncKeys
{
  return 0;
}

- (NSArray)dirtySyncKeys
{
  return 0;
}

- (id)metadataForKey:(id)a3
{
  return 0;
}

- (BOOL)purgeCache
{
  return 0;
}

- (BOOL)purgeAsset
{
  return 0;
}

- (unint64_t)numberOfSectionsForAnnotations
{
  return 0;
}

- (unint64_t)numberOfAnnotationsInSection:(unint64_t)a3 withType:(int)a4
{
  return 0;
}

- (id)annotationsInSection:(unint64_t)a3 withType:(int)a4 sortedBy:(int)a5 ascending:(BOOL)a6 range:(_NSRange)a7
{
  return 0;
}

@end
@interface NMSPartialDownloadableItem
- (BOOL)isEqual:(id)a3;
- (NMSPartialDownloadableItem)initWithMediaLibraryIdentifier:(id)a3 externalLibraryIdentifier:(id)a4 size:(unint64_t)a5 itemType:(unint64_t)a6 manuallyAdded:(BOOL)a7 minimumSize:(unint64_t)a8 offset:(unint64_t)a9;
- (id)description;
- (unint64_t)hash;
- (unint64_t)minimumSize;
- (unint64_t)offset;
@end

@implementation NMSPartialDownloadableItem

- (NMSPartialDownloadableItem)initWithMediaLibraryIdentifier:(id)a3 externalLibraryIdentifier:(id)a4 size:(unint64_t)a5 itemType:(unint64_t)a6 manuallyAdded:(BOOL)a7 minimumSize:(unint64_t)a8 offset:(unint64_t)a9
{
  v11.receiver = self;
  v11.super_class = (Class)NMSPartialDownloadableItem;
  result = [(NMSDownloadableItem *)&v11 initWithMediaLibraryIdentifier:a3 externalLibraryIdentifier:a4 size:a5 itemType:a6 manuallyAdded:a7];
  if (result)
  {
    result->_minimumSize = a8;
    result->_offset = a9;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NMSPartialDownloadableItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)NMSPartialDownloadableItem;
    if ([(NMSDownloadableItem *)&v12 isEqual:v6]
      && (unint64_t v7 = [(NMSPartialDownloadableItem *)self offset],
          v7 == [(NMSPartialDownloadableItem *)v6 offset])
      && (unint64_t v8 = [(NMSPartialDownloadableItem *)self minimumSize],
          v8 == [(NMSPartialDownloadableItem *)v6 minimumSize]))
    {
      unint64_t v9 = [(NMSDownloadableItem *)self size];
      BOOL v10 = v9 == [(NMSDownloadableItem *)v6 size];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)NMSPartialDownloadableItem;
  unint64_t v3 = self->_offset ^ [(NMSDownloadableItem *)&v6 hash];
  unint64_t minimumSize = self->_minimumSize;
  return v3 ^ minimumSize ^ [(NMSDownloadableItem *)self size];
}

- (id)description
{
  unint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)NMSPartialDownloadableItem;
  v4 = [(NMSDownloadableItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"<%@ - minimumSize: %llu - offset: %llu>", v4, -[NMSPartialDownloadableItem minimumSize](self, "minimumSize"), -[NMSPartialDownloadableItem offset](self, "offset")];

  return v5;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unint64_t)minimumSize
{
  return self->_minimumSize;
}

@end
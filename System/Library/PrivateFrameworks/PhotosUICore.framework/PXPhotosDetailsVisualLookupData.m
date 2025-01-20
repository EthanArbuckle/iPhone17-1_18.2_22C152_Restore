@interface PXPhotosDetailsVisualLookupData
- (BOOL)_isEqualToVisualLookupData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)displayMessage;
- (NSString)glyphImageName;
- (NSString)visualDomain;
- (PXPhotosDetailsVisualLookupData)init;
- (PXPhotosDetailsVisualLookupData)initWithGlyphName:(id)a3 visualDomain:(id)a4 displayMessage:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)setDisplayMessage:(id)a3;
- (void)setGlyphImageName:(id)a3;
- (void)setVisualDomain:(id)a3;
@end

@implementation PXPhotosDetailsVisualLookupData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualDomain, 0);
  objc_storeStrong((id *)&self->_glyphImageName, 0);
  objc_storeStrong((id *)&self->_displayMessage, 0);
}

- (void)setVisualDomain:(id)a3
{
}

- (NSString)visualDomain
{
  return self->_visualDomain;
}

- (void)setGlyphImageName:(id)a3
{
}

- (NSString)glyphImageName
{
  return self->_glyphImageName;
}

- (void)setDisplayMessage:(id)a3
{
}

- (NSString)displayMessage
{
  return self->_displayMessage;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(PXPhotosDetailsVisualLookupData *)self glyphImageName];
  v6 = [(PXPhotosDetailsVisualLookupData *)self visualDomain];
  v7 = [(PXPhotosDetailsVisualLookupData *)self displayMessage];
  v8 = objc_msgSend(v3, "initWithFormat:", @"<%@: %p; glyph name = %@, domain name = %@, display message = %@>",
                 v4,
                 self,
                 v5,
                 v6,
                 v7);

  return v8;
}

- (unint64_t)hash
{
  id v3 = [(PXPhotosDetailsVisualLookupData *)self glyphImageName];
  uint64_t v4 = [v3 hash];
  v5 = [(PXPhotosDetailsVisualLookupData *)self visualDomain];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(PXPhotosDetailsVisualLookupData *)self displayMessage];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)_isEqualToVisualLookupData:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosDetailsVisualLookupData *)self glyphImageName];
  id v6 = [v4 glyphImageName];
  if (v5 == v6)
  {

LABEL_5:
    id v9 = [(PXPhotosDetailsVisualLookupData *)self visualDomain];
    id v10 = [v4 visualDomain];
    if (v9 == v10)
    {
    }
    else
    {
      int v11 = [v9 isEqualToString:v10];

      if (!v11)
      {
        char v8 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    v12 = [(PXPhotosDetailsVisualLookupData *)self displayMessage];
    v13 = [v4 displayMessage];
    if (v12 == v13) {
      char v8 = 1;
    }
    else {
      char v8 = [v12 isEqualToString:v13];
    }

    goto LABEL_13;
  }
  int v7 = [v5 isEqualToString:v6];

  if (v7) {
    goto LABEL_5;
  }
  char v8 = 0;
LABEL_14:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PXPhotosDetailsVisualLookupData *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (v7.receiver = self,
          v7.super_class = (Class)PXPhotosDetailsVisualLookupData,
          [(PXPhotosDetailsVisualLookupData *)&v7 isEqual:v4])
      && [(PXPhotosDetailsVisualLookupData *)self _isEqualToVisualLookupData:v4];
  }

  return v5;
}

- (PXPhotosDetailsVisualLookupData)initWithGlyphName:(id)a3 visualDomain:(id)a4 displayMessage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotosDetailsVisualLookupData;
  v12 = [(PXPhotosDetailsVisualLookupData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_glyphImageName, a3);
    objc_storeStrong((id *)&v13->_visualDomain, a4);
    objc_storeStrong((id *)&v13->_displayMessage, a5);
  }

  return v13;
}

- (PXPhotosDetailsVisualLookupData)init
{
  return [(PXPhotosDetailsVisualLookupData *)self initWithGlyphName:0 visualDomain:0 displayMessage:0];
}

@end
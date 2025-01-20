@interface PXPeopleFaceTile
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserDefined;
- (PHAsset)asset;
- (PHFace)face;
- (PHPerson)person;
- (PXPeopleFaceTile)initWithFace:(id)a3 asset:(id)a4 person:(id)a5;
- (id)description;
@end

@implementation PXPeopleFaceTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (PHFace)face
{
  return self->_face;
}

- (PHPerson)person
{
  return self->_person;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PXPeopleFaceTile *)self person];
    id v7 = [v5 person];
    if (v6 == v7)
    {
    }
    else
    {
      int v8 = [v6 isEqual:v7];

      if (!v8)
      {
        char v9 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    id v10 = [(PXPeopleFaceTile *)self face];
    id v11 = [v5 face];
    if (v10 == v11)
    {
    }
    else
    {
      int v12 = [v10 isEqual:v11];

      if (!v12)
      {
        char v9 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v13 = [(PXPeopleFaceTile *)self asset];
    v14 = [v5 asset];
    if (v13 == v14) {
      char v9 = 1;
    }
    else {
      char v9 = [v13 isEqual:v14];
    }

    goto LABEL_15;
  }
  char v9 = 0;
LABEL_17:

  return v9;
}

- (BOOL)isUserDefined
{
  v2 = [(PXPeopleFaceTile *)self face];
  char v3 = [v2 manual];

  return v3;
}

- (id)description
{
  char v3 = NSString;
  id v4 = [(PXPeopleFaceTile *)self face];
  id v5 = [v4 localIdentifier];
  id v6 = [(PXPeopleFaceTile *)self person];
  id v7 = [v6 name];
  int v8 = [(PXPeopleFaceTile *)self person];
  char v9 = [v8 localIdentifier];
  id v10 = [(PXPeopleFaceTile *)self asset];
  id v11 = [v10 localIdentifier];
  int v12 = [v3 stringWithFormat:@"face:%@, person:%@(%@), asset:%@", v5, v7, v9, v11];

  return v12;
}

- (PXPeopleFaceTile)initWithFace:(id)a3 asset:(id)a4 person:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleFaceTile;
  int v12 = [(PXPeopleFaceTile *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_face, a3);
    objc_storeStrong((id *)&v13->_asset, a4);
    objc_storeStrong((id *)&v13->_person, a5);
  }

  return v13;
}

@end
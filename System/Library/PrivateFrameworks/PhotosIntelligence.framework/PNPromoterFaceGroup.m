@interface PNPromoterFaceGroup
- (BOOL)isDirty;
- (NSString)localIdentifier;
- (PNPromoterFaceGroup)initWithGroupIdentifier:(id)a3 andFaceIdentifiers:(id)a4;
- (unint64_t)faceCountInFaceGroup;
@end

@implementation PNPromoterFaceGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

- (BOOL)isDirty
{
  return 0;
}

- (unint64_t)faceCountInFaceGroup
{
  return [(NSArray *)self->_faceIdentifiers count];
}

- (NSString)localIdentifier
{
  return (NSString *)[NSString stringWithFormat:@"%@", self->_groupIdentifier];
}

- (PNPromoterFaceGroup)initWithGroupIdentifier:(id)a3 andFaceIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PNPromoterFaceGroup;
  v9 = [(PNPromoterFaceGroup *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_groupIdentifier, a3);
    objc_storeStrong((id *)&v10->_faceIdentifiers, a4);
  }

  return v10;
}

@end
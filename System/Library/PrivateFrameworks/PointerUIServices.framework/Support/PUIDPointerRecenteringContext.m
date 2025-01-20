@interface PUIDPointerRecenteringContext
- (BKSContextRelativePoint)contextRelativePointerPosition;
- (BOOL)isEqual:(id)a3;
- (NSString)displayUUID;
- (PUIDPointerRecenteringContext)initWithContextRelativePointerPosition:(id)a3 displayUUID:(id)a4 restrictingToPID:(int)a5;
- (int)restrictingToPID;
- (unint64_t)hash;
@end

@implementation PUIDPointerRecenteringContext

- (PUIDPointerRecenteringContext)initWithContextRelativePointerPosition:(id)a3 displayUUID:(id)a4 restrictingToPID:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUIDPointerRecenteringContext;
  v11 = [(PUIDPointerRecenteringContext *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contextRelativePointerPosition, a3);
    v13 = (NSString *)[v10 copy];
    displayUUID = v12->_displayUUID;
    v12->_displayUUID = v13;

    v12->_restrictingToPID = a5;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(BKSContextRelativePoint *)self->_contextRelativePointerPosition hash];
  return [(NSString *)self->_displayUUID hash] ^ v3 ^ self->_restrictingToPID;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PUIDPointerRecenteringContext *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    unsigned int v5 = [(PUIDPointerRecenteringContext *)self restrictingToPID];
    if (v5 != [(PUIDPointerRecenteringContext *)v4 restrictingToPID]) {
      goto LABEL_6;
    }
    v6 = [(PUIDPointerRecenteringContext *)self displayUUID];
    v7 = [(PUIDPointerRecenteringContext *)v4 displayUUID];
    int v8 = BSEqualObjects();

    if (v8)
    {
      id v9 = [(PUIDPointerRecenteringContext *)self contextRelativePointerPosition];
      id v10 = [(PUIDPointerRecenteringContext *)v4 contextRelativePointerPosition];
      char v11 = BSEqualObjects();
    }
    else
    {
LABEL_6:
      char v11 = 0;
    }
  }

  return v11;
}

- (BKSContextRelativePoint)contextRelativePointerPosition
{
  return self->_contextRelativePointerPosition;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (int)restrictingToPID
{
  return self->_restrictingToPID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
  objc_storeStrong((id *)&self->_contextRelativePointerPosition, 0);
}

@end
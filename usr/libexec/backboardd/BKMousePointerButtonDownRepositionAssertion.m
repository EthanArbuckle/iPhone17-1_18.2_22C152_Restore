@interface BKMousePointerButtonDownRepositionAssertion
- (BKMousePointerButtonDownRepositionAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 contextRelativePointerPosition:(id)a5 displayUUID:(id)a6 restrictingToPID:(int)a7 invalidationBlock:(id)a8;
- (BKSContextRelativePoint)contextRelativePointerPosition;
- (NSString)displayUUID;
- (int)restrictingToPID;
@end

@implementation BKMousePointerButtonDownRepositionAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);

  objc_storeStrong((id *)&self->_contextRelativePointerPosition, 0);
}

- (int)restrictingToPID
{
  return self->_restrictingToPID;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (BKSContextRelativePoint)contextRelativePointerPosition
{
  return self->_contextRelativePointerPosition;
}

- (BKMousePointerButtonDownRepositionAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 contextRelativePointerPosition:(id)a5 displayUUID:(id)a6 restrictingToPID:(int)a7 invalidationBlock:(id)a8
{
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BKMousePointerButtonDownRepositionAssertion;
  v17 = [(BKMousePointerButtonDownRepositionAssertion *)&v20 initWithIdentifier:a3 forReason:a4 invalidationBlock:a8];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contextRelativePointerPosition, a5);
    objc_storeStrong((id *)&v18->_displayUUID, a6);
    v18->_restrictingToPID = a7;
  }

  return v18;
}

@end
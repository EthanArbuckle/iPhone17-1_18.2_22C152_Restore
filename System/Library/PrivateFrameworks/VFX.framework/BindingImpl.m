@interface BindingImpl
- (NSArray)enumCases;
- (NSData)rawValue;
- (NSString)bindingName;
- (NSString)enumName;
- (NSString)identifier;
- (NSString)objectName;
- (NSString)userManual;
- (double)max;
- (double)min;
- (int64_t)objectID;
- (int64_t)semantic;
- (int64_t)type;
- (void)setBindingName:(id)a3;
- (void)setEnumCases:(id)a3;
- (void)setEnumName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMax:(double)a3;
- (void)setMin:(double)a3;
- (void)setObjectID:(int64_t)a3;
- (void)setObjectName:(id)a3;
- (void)setRawValue:(id)a3;
- (void)setSemantic:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setUserManual:(id)a3;
@end

@implementation BindingImpl

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B6E31768();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  *(void *)self->identifier = sub_1B6E31798();
  *(void *)&self->identifier[8] = v4;

  swift_bridgeObjectRelease();
}

- (int64_t)objectID
{
  return *(void *)self->objectID;
}

- (void)setObjectID:(int64_t)a3
{
  *(void *)self->objectID = a3;
}

- (NSString)objectName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B6E31768();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setObjectName:(id)a3
{
  *(void *)self->objectName = sub_1B6E31798();
  *(void *)&self->objectName[8] = v4;

  swift_bridgeObjectRelease();
}

- (NSString)bindingName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B6E31768();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setBindingName:(id)a3
{
  *(void *)self->bindingName = sub_1B6E31798();
  *(void *)&self->bindingName[8] = v4;

  swift_bridgeObjectRelease();
}

- (NSString)userManual
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B6E31768();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setUserManual:(id)a3
{
  *(void *)self->userManual = sub_1B6E31798();
  *(void *)&self->userManual[8] = v4;

  swift_bridgeObjectRelease();
}

- (int64_t)type
{
  return *(void *)self->type;
}

- (void)setType:(int64_t)a3
{
  *(void *)self->type = a3;
}

- (int64_t)semantic
{
  return *(void *)self->semantic;
}

- (void)setSemantic:(int64_t)a3
{
  *(void *)self->semantic = a3;
}

- (double)min
{
  return *(double *)self->min;
}

- (void)setMin:(double)a3
{
  *(double *)self->min = a3;
}

- (double)max
{
  return *(double *)self->max;
}

- (void)setMax:(double)a3
{
  *(double *)self->max = a3;
}

- (NSString)enumName
{
  if (*(void *)&self->enumName[15])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B6E31768();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setEnumName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1B6E31798();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  *(void *)&self->enumName[7] = v4;
  *(void *)&self->enumName[15] = v5;

  swift_bridgeObjectRelease();
}

- (NSArray)enumCases
{
  if (*(void *)&self->enumCases[7])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B6E31C18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (void)setEnumCases:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1B6E31C28();
  }
  else {
    uint64_t v4 = 0;
  }
  *(void *)&self->enumCases[7] = v4;

  swift_bridgeObjectRelease();
}

- (NSData)rawValue
{
  swift_retain();
  uint64_t v2 = sub_1B6658EFC();
  unint64_t v4 = v3;
  swift_release();
  if (v4 >> 60 == 15)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = (void *)sub_1B6E30FC8();
    sub_1B665D488(v2, v4);
  }

  return (NSData *)v5;
}

- (void)setRawValue:(id)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    swift_retain();
    id v4 = v3;
    unint64_t v3 = (void *)sub_1B6E30FD8();
    unint64_t v6 = v5;
  }
  else
  {
    swift_retain();
    unint64_t v6 = 0xF000000000000000;
  }
  sub_1B6659134((uint64_t)v3, v6);

  swift_release();
}

@end
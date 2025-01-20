@interface OADPresetShapeGeometry
- (id)description;
- (id)equivalentCustomGeometry;
- (id)escherEquivalentCustomGeometry;
- (id)oa12EquivalentCustomGeometry;
- (int)type;
- (void)setType:(int)a3;
@end

@implementation OADPresetShapeGeometry

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (int)type
{
  return self->mType;
}

- (id)equivalentCustomGeometry
{
  if (self->super.mIsEscher) {
    [(OADPresetShapeGeometry *)self escherEquivalentCustomGeometry];
  }
  else {
  v3 = [(OADPresetShapeGeometry *)self oa12EquivalentCustomGeometry];
  }
  if (v3)
  {
    v4 = [(NSMutableDictionary *)self->super.mAdjustValues keyEnumerator];
    for (i = 0; ; i = v6)
    {
      v6 = [v4 nextObject];

      if (!v6) {
        break;
      }
      uint64_t v7 = [v6 unsignedIntValue];
      objc_msgSend(v3, "setAdjustValue:atIndex:", -[OADShapeGeometry adjustValueAtIndex:](self, "adjustValueAtIndex:", v7), v7);
    }
    id v8 = v3;
  }
  return v3;
}

- (id)escherEquivalentCustomGeometry
{
  EshGeometryProperties::EshGeometryProperties((EshGeometryProperties *)&v10);
  if (EshShapeLib::cloneShapeProperties((EshShapeLib *)LOWORD(self->mType), &v10, v3))
  {
    EshGeometryProperties::addImpliedSegments(&v10);
    v4 = objc_alloc_init(OADCustomShapeGeometry);
    [(OADShapeGeometry *)v4 setIsEscher:1];
    uint64_t Vertices = EshGeometryProperties::getVertices((EshGeometryProperties *)&v10);
    +[OABShapeGeometry readFromPathCommands:EshGeometryProperties::getSegments((EshGeometryProperties *)&v10) pathParams:Vertices toGeometry:v4];
    +[OABShapeGeometry readFromFormulas:EshGeometryProperties::getFormulas((EshGeometryProperties *)&v10) toGeometry:v4];
    if (EshGeometryProperties::isInscribesSet((EshGeometryProperties *)&v10)) {
      +[OABShapeGeometry readFromTextBoxRects:EshGeometryProperties::getInscribes((EshGeometryProperties *)&v10) toGeometry:v4];
    }
    long long v9 = v11;
    [(OADCustomShapeGeometry *)v4 setGeometryCoordSpace:&v9];
    uint64_t v8 = v13;
    +[OABShapeGeometry readFromLimo:&v8 toGeometry:v4];
    for (uint64_t i = 0; i != 10; ++i)
      [(OADShapeGeometry *)v4 setAdjustValue:v12[i] atIndex:i];
  }
  else
  {
    v4 = 0;
  }
  EshGeometryProperties::~EshGeometryProperties((EshGeometryProperties *)&v10);
  return v4;
}

- (id)oa12EquivalentCustomGeometry
{
  v2 = +[OAXGeometry stringWritingShapeType:self->mType];
  v3 = +[TCBundleResourceManager instance];
  v4 = (_xmlDoc *)[v3 xmlDocumentForResource:v2 ofType:@"xml" inPackage:@"OAShapeTypes"];
  if (v4)
  {
    xmlNodePtr v5 = OCXGetRootElement(v4);
    v6 = [[OAXDrawingState alloc] initWithClient:0];
    uint64_t v7 = +[OAXGeometry readCustomGeometryFromXmlNode:v5 hasImplicitFormulas:1 drawingState:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADPresetShapeGeometry;
  v2 = [(OADShapeGeometry *)&v4 description];
  return v2;
}

@end
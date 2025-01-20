@interface CRFormFieldOutputRegion
- (BOOL)hasBoundedHeight;
- (BOOL)hasBoundedWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldComputeBoundsFromChildren;
- (CRFormFieldOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5;
- (CRFormFieldOutputRegion)initWithQuad:(id)a3 labelRegion:(id)a4 subFields:(id)a5 source:(unint64_t)a6;
- (CROutputRegion)labelRegion;
- (NSString)fieldValue;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)crCodableDataRepresentation;
- (id)debugInfo;
- (id)precedingExternalField;
- (unint64_t)fieldSource;
- (unint64_t)fieldType;
- (unint64_t)indexInGlobalOrder;
- (unint64_t)source;
- (unint64_t)type;
- (void)setHasBoundedHeight:(BOOL)a3;
- (void)setHasBoundedWidth:(BOOL)a3;
- (void)setIndexInGlobalOrder:(unint64_t)a3;
- (void)setLabelRegion:(id)a3;
- (void)setPrecedingExternalField:(id)a3;
@end

@implementation CRFormFieldOutputRegion

- (CRFormFieldOutputRegion)initWithQuad:(id)a3 labelRegion:(id)a4 subFields:(id)a5 source:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRFormFieldOutputRegion;
  v13 = [(CROutputRegion *)&v19 initWithConfidence:2 baselineAngle:0.0];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_labelRegion, a4);
    v14->_fieldSource = a6;
    [(CROutputRegion *)v14 setBoundingQuad:v10];
    v15 = (void *)[v12 copy];
    [(CROutputRegion *)v14 setFormFieldRegions:v15];

    v14->_hasBoundedWidth = 0;
    v14->_hasBoundedHeight = 0;
    uint64_t v16 = objc_opt_new();
    debugInfo = v14->_debugInfo;
    v14->_debugInfo = (NSMutableDictionary *)v16;
  }
  return v14;
}

- (void)setLabelRegion:(id)a3
{
}

- (unint64_t)type
{
  return 0x2000;
}

- (unint64_t)fieldType
{
  return 0;
}

- (unint64_t)source
{
  return self->_fieldSource;
}

- (BOOL)shouldComputeBoundsFromChildren
{
  return 0;
}

- (id)debugInfo
{
  return self->_debugInfo;
}

- (CRFormFieldOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRFormFieldOutputRegion;
  v9 = [(CROutputRegion *)&v16 initWithCRCodableDataRepresentation:v8 version:a4 offset:a5];
  if (v9)
  {
    id v10 = +[CRCodingUtilities objectDataFromEncodingData:v8 offset:a5];
    uint64_t v11 = +[CROutputRegion outputRegionWithCRCodableDataRepresentation:v10];
    labelRegion = v9->_labelRegion;
    v9->_labelRegion = (CROutputRegion *)v11;

    v9->_fieldSource = +[CRCodingUtilities unsignedIntegerFromEncodingData:v8 offset:a5];
    v9->_indexInGlobalOrder = +[CRCodingUtilities unsignedIntegerFromEncodingData:v8 offset:a5];
    uint64_t v13 = objc_opt_new();
    debugInfo = v9->_debugInfo;
    v9->_debugInfo = (NSMutableDictionary *)v13;
  }
  return v9;
}

- (id)crCodableDataRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  v7.receiver = self;
  v7.super_class = (Class)CRFormFieldOutputRegion;
  v4 = [(CROutputRegion *)&v7 crCodableDataRepresentation];
  v5 = [v3 dataWithData:v4];

  +[CRCodingUtilities appendCodable:self->_labelRegion toData:v5];
  +[CRCodingUtilities appendUInteger:self->_fieldSource toData:v5];
  +[CRCodingUtilities appendUInteger:self->_indexInGlobalOrder toData:v5];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  v14.receiver = self;
  v14.super_class = (Class)CRFormFieldOutputRegion;
  id v7 = [(CROutputRegion *)&v14 copyWithZone:a3 copyChildren:a4 copyCandidates:a5 deepCopy:a6];
  id v8 = [(CRFormFieldOutputRegion *)self labelRegion];
  [v7 setLabelRegion:v8];

  *((void *)v7 + 47) = [(CRFormFieldOutputRegion *)self fieldSource];
  uint64_t v9 = [(CRFormFieldOutputRegion *)self precedingExternalField];
  id v10 = (void *)*((void *)v7 + 42);
  *((void *)v7 + 42) = v9;

  *((void *)v7 + 45) = [(CRFormFieldOutputRegion *)self indexInGlobalOrder];
  *((unsigned char *)v7 + 352) = [(CRFormFieldOutputRegion *)self hasBoundedWidth];
  *((unsigned char *)v7 + 353) = [(CRFormFieldOutputRegion *)self hasBoundedHeight];
  uint64_t v11 = [(CRFormFieldOutputRegion *)self debugInfo];
  id v12 = (void *)*((void *)v7 + 43);
  *((void *)v7 + 43) = v11;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CRFormFieldOutputRegion *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(CROutputRegion *)self boundingQuad];
      id v7 = [(CROutputRegion *)v5 boundingQuad];
      int v8 = [v6 isEqual:v7];

      if (v8
        && (unint64_t v9 = [(CRFormFieldOutputRegion *)self fieldType],
            v9 == [(CRFormFieldOutputRegion *)v5 fieldType])
        && (unint64_t v10 = [(CRFormFieldOutputRegion *)self fieldSource],
            v10 == [(CRFormFieldOutputRegion *)v5 fieldSource])
        && (BOOL v11 = [(CRFormFieldOutputRegion *)self hasBoundedWidth],
            v11 == [(CRFormFieldOutputRegion *)v5 hasBoundedWidth])
        && (BOOL v12 = [(CRFormFieldOutputRegion *)self hasBoundedHeight],
            v12 == [(CRFormFieldOutputRegion *)v5 hasBoundedHeight]))
      {
        v15 = [(CRFormFieldOutputRegion *)self fieldValue];
        objc_super v16 = [(CRFormFieldOutputRegion *)v5 fieldValue];
        char v13 = [v15 isEqualToString:v16];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (void)setPrecedingExternalField:(id)a3
{
}

- (id)precedingExternalField
{
  return self->_precedingExternalField;
}

- (unint64_t)indexInGlobalOrder
{
  return self->_indexInGlobalOrder;
}

- (void)setIndexInGlobalOrder:(unint64_t)a3
{
  self->_indexInGlobalOrder = a3;
}

- (BOOL)hasBoundedWidth
{
  return self->_hasBoundedWidth;
}

- (void)setHasBoundedWidth:(BOOL)a3
{
  self->_hasBoundedWidth = a3;
}

- (BOOL)hasBoundedHeight
{
  return self->_hasBoundedHeight;
}

- (void)setHasBoundedHeight:(BOOL)a3
{
  self->_hasBoundedHeight = a3;
}

- (CROutputRegion)labelRegion
{
  return (CROutputRegion *)objc_getProperty(self, a2, 368, 1);
}

- (unint64_t)fieldSource
{
  return self->_fieldSource;
}

- (NSString)fieldValue
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValue, 0);
  objc_storeStrong((id *)&self->_labelRegion, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_precedingExternalField, 0);
}

@end
@interface CRFormSelectableFieldOutputRegion
- (CRFormSelectableFieldOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5;
- (CRFormSelectableFieldOutputRegion)initWithQuad:(id)a3 type:(unint64_t)a4 labelRegion:(id)a5 source:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)crCodableDataRepresentation;
- (unint64_t)fieldType;
- (unint64_t)selectableFieldType;
- (void)setSelectableFieldType:(unint64_t)a3;
@end

@implementation CRFormSelectableFieldOutputRegion

- (CRFormSelectableFieldOutputRegion)initWithQuad:(id)a3 type:(unint64_t)a4 labelRegion:(id)a5 source:(unint64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)CRFormSelectableFieldOutputRegion;
  v7 = [(CRFormFieldOutputRegion *)&v10 initWithQuad:a3 labelRegion:a5 subFields:0 source:a6];
  v8 = v7;
  if (v7)
  {
    v7->_selectableFieldType = a4;
    [(CRFormFieldOutputRegion *)v7 setHasBoundedWidth:1];
    [(CRFormFieldOutputRegion *)v8 setHasBoundedHeight:1];
  }
  return v8;
}

- (unint64_t)fieldType
{
  return 2;
}

- (void)setSelectableFieldType:(unint64_t)a3
{
  self->_selectableFieldType = a3;
}

- (CRFormSelectableFieldOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRFormSelectableFieldOutputRegion;
  v9 = [(CRFormFieldOutputRegion *)&v11 initWithCRCodableDataRepresentation:v8 version:a4 offset:a5];
  if (v9) {
    v9->_selectableFieldType = +[CRCodingUtilities unsignedIntegerFromEncodingData:v8 offset:a5];
  }

  return v9;
}

- (id)crCodableDataRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  v7.receiver = self;
  v7.super_class = (Class)CRFormSelectableFieldOutputRegion;
  v4 = [(CRFormFieldOutputRegion *)&v7 crCodableDataRepresentation];
  v5 = [v3 dataWithData:v4];

  +[CRCodingUtilities appendUInteger:self->_selectableFieldType toData:v5];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  v9.receiver = self;
  v9.super_class = (Class)CRFormSelectableFieldOutputRegion;
  id v7 = [(CRFormFieldOutputRegion *)&v9 copyWithZone:a3 copyChildren:a4 copyCandidates:a5 deepCopy:a6];
  objc_msgSend(v7, "setSelectableFieldType:", -[CRFormSelectableFieldOutputRegion selectableFieldType](self, "selectableFieldType"));
  return v7;
}

- (unint64_t)selectableFieldType
{
  return self->_selectableFieldType;
}

@end
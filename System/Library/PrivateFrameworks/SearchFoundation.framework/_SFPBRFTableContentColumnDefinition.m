@interface _SFPBRFTableContentColumnDefinition
- (BOOL)disable_truncation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)should_drop_in_flow_layout;
- (NSData)jsonData;
- (_SFPBRFTableContentColumnDefinition)initWithDictionary:(id)a3;
- (_SFPBRFTableContentColumnDefinition)initWithFacade:(id)a3;
- (_SFPBRFTableContentColumnDefinition)initWithJSON:(id)a3;
- (float)size_percent;
- (id)dictionaryRepresentation;
- (int)drop_order;
- (int)equal_size_column_group;
- (int)horizontal_alignment;
- (unint64_t)hash;
- (void)setDisable_truncation:(BOOL)a3;
- (void)setDrop_order:(int)a3;
- (void)setEqual_size_column_group:(int)a3;
- (void)setHorizontal_alignment:(int)a3;
- (void)setShould_drop_in_flow_layout:(BOOL)a3;
- (void)setSize_percent:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFTableContentColumnDefinition

- (_SFPBRFTableContentColumnDefinition)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFTableContentColumnDefinition *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "size_percent");

    if (v6)
    {
      v7 = objc_msgSend(v4, "size_percent");
      [v7 floatValue];
      -[_SFPBRFTableContentColumnDefinition setSize_percent:](v5, "setSize_percent:");
    }
    if (objc_msgSend(v4, "hasHorizontal_alignment")) {
      -[_SFPBRFTableContentColumnDefinition setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v4, "horizontal_alignment"));
    }
    v8 = objc_msgSend(v4, "drop_order");

    if (v8)
    {
      v9 = objc_msgSend(v4, "drop_order");
      -[_SFPBRFTableContentColumnDefinition setDrop_order:](v5, "setDrop_order:", [v9 intValue]);
    }
    v10 = objc_msgSend(v4, "equal_size_column_group");

    if (v10)
    {
      v11 = objc_msgSend(v4, "equal_size_column_group");
      -[_SFPBRFTableContentColumnDefinition setEqual_size_column_group:](v5, "setEqual_size_column_group:", [v11 intValue]);
    }
    if (objc_msgSend(v4, "hasDisable_truncation")) {
      -[_SFPBRFTableContentColumnDefinition setDisable_truncation:](v5, "setDisable_truncation:", objc_msgSend(v4, "disable_truncation"));
    }
    if (objc_msgSend(v4, "hasShould_drop_in_flow_layout")) {
      -[_SFPBRFTableContentColumnDefinition setShould_drop_in_flow_layout:](v5, "setShould_drop_in_flow_layout:", objc_msgSend(v4, "should_drop_in_flow_layout"));
    }
    v12 = v5;
  }

  return v5;
}

- (BOOL)should_drop_in_flow_layout
{
  return self->_should_drop_in_flow_layout;
}

- (BOOL)disable_truncation
{
  return self->_disable_truncation;
}

- (int)equal_size_column_group
{
  return self->_equal_size_column_group;
}

- (int)drop_order
{
  return self->_drop_order;
}

- (int)horizontal_alignment
{
  return self->_horizontal_alignment;
}

- (float)size_percent
{
  return self->_size_percent;
}

- (_SFPBRFTableContentColumnDefinition)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBRFTableContentColumnDefinition;
  v5 = [(_SFPBRFTableContentColumnDefinition *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sizePercent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[_SFPBRFTableContentColumnDefinition setSize_percent:](v5, "setSize_percent:");
    }
    v7 = [v4 objectForKeyedSubscript:@"horizontalAlignment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableContentColumnDefinition setHorizontal_alignment:](v5, "setHorizontal_alignment:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"dropOrder"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableContentColumnDefinition setDrop_order:](v5, "setDrop_order:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"equalSizeColumnGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableContentColumnDefinition setEqual_size_column_group:](v5, "setEqual_size_column_group:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"disableTruncation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableContentColumnDefinition setDisable_truncation:](v5, "setDisable_truncation:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"shouldDropInFlowLayout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableContentColumnDefinition setShould_drop_in_flow_layout:](v5, "setShould_drop_in_flow_layout:", [v11 BOOLValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBRFTableContentColumnDefinition)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFTableContentColumnDefinition *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFTableContentColumnDefinition *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_disable_truncation)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFTableContentColumnDefinition disable_truncation](self, "disable_truncation"));
    [v3 setObject:v4 forKeyedSubscript:@"disableTruncation"];
  }
  if (self->_drop_order)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBRFTableContentColumnDefinition drop_order](self, "drop_order"));
    [v3 setObject:v5 forKeyedSubscript:@"dropOrder"];
  }
  if (self->_equal_size_column_group)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBRFTableContentColumnDefinition equal_size_column_group](self, "equal_size_column_group"));
    [v3 setObject:v6 forKeyedSubscript:@"equalSizeColumnGroup"];
  }
  if (self->_horizontal_alignment)
  {
    uint64_t v7 = [(_SFPBRFTableContentColumnDefinition *)self horizontal_alignment];
    if (v7 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E5A2F070[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"horizontalAlignment"];
  }
  if (self->_should_drop_in_flow_layout)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFTableContentColumnDefinition should_drop_in_flow_layout](self, "should_drop_in_flow_layout"));
    [v3 setObject:v9 forKeyedSubscript:@"shouldDropInFlowLayout"];
  }
  if (self->_size_percent != 0.0)
  {
    v10 = NSNumber;
    [(_SFPBRFTableContentColumnDefinition *)self size_percent];
    v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"sizePercent"];
  }
  return v3;
}

- (unint64_t)hash
{
  float size_percent = self->_size_percent;
  BOOL v4 = size_percent < 0.0;
  if (size_percent == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v5 = size_percent;
    double v6 = -v5;
    if (!v4) {
      double v6 = v5;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v9 += (unint64_t)v8;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
  }
  if (self->_disable_truncation) {
    uint64_t v10 = 2654435761;
  }
  else {
    uint64_t v10 = 0;
  }
  if (self->_should_drop_in_flow_layout) {
    uint64_t v11 = 2654435761;
  }
  else {
    uint64_t v11 = 0;
  }
  return (2654435761 * self->_horizontal_alignment) ^ v9 ^ (2654435761 * self->_drop_order) ^ (2654435761
                                                                                                 * self->_equal_size_column_group) ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (float size_percent = self->_size_percent, objc_msgSend(v4, "size_percent"), size_percent == v6)
    && (int horizontal_alignment = self->_horizontal_alignment,
        horizontal_alignment == objc_msgSend(v4, "horizontal_alignment"))
    && (int drop_order = self->_drop_order, drop_order == objc_msgSend(v4, "drop_order"))
    && (int equal_size_column_group = self->_equal_size_column_group,
        equal_size_column_group == objc_msgSend(v4, "equal_size_column_group"))
    && (int disable_truncation = self->_disable_truncation,
        disable_truncation == objc_msgSend(v4, "disable_truncation")))
  {
    int should_drop_in_flow_layout = self->_should_drop_in_flow_layout;
    BOOL v12 = should_drop_in_flow_layout == objc_msgSend(v4, "should_drop_in_flow_layout");
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  [(_SFPBRFTableContentColumnDefinition *)self size_percent];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_SFPBRFTableContentColumnDefinition *)self horizontal_alignment]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRFTableContentColumnDefinition *)self drop_order]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRFTableContentColumnDefinition *)self equal_size_column_group]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRFTableContentColumnDefinition *)self disable_truncation]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBRFTableContentColumnDefinition *)self should_drop_in_flow_layout]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTableContentColumnDefinitionReadFrom(self, (uint64_t)a3, v3);
}

- (void)setShould_drop_in_flow_layout:(BOOL)a3
{
  self->_int should_drop_in_flow_layout = a3;
}

- (void)setDisable_truncation:(BOOL)a3
{
  self->_int disable_truncation = a3;
}

- (void)setEqual_size_column_group:(int)a3
{
  self->_int equal_size_column_group = a3;
}

- (void)setDrop_order:(int)a3
{
  self->_int drop_order = a3;
}

- (void)setHorizontal_alignment:(int)a3
{
  self->_int horizontal_alignment = a3;
}

- (void)setSize_percent:(float)a3
{
  self->_float size_percent = a3;
}

@end
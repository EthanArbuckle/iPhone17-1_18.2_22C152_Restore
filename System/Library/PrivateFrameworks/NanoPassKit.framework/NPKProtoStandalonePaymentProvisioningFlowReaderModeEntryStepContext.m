@interface NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext
+ (Class)setupFieldsType;
- (BOOL)hasProduct;
- (BOOL)hasSubtitle;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentSetupProduct)product;
- (NSMutableArray)setupFields;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)setupFieldsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)setupFieldsCount;
- (void)addSetupFields:(id)a3;
- (void)clearSetupFields;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProduct:(id)a3;
- (void)setSetupFields:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (void)clearSetupFields
{
}

- (void)addSetupFields:(id)a3
{
  id v4 = a3;
  setupFields = self->_setupFields;
  id v8 = v4;
  if (!setupFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_setupFields;
    self->_setupFields = v6;

    id v4 = v8;
    setupFields = self->_setupFields;
  }
  [(NSMutableArray *)setupFields addObject:v4];
}

- (unint64_t)setupFieldsCount
{
  return [(NSMutableArray *)self->_setupFields count];
}

- (id)setupFieldsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_setupFields objectAtIndex:a3];
}

+ (Class)setupFieldsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProduct
{
  return self->_product != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext;
  id v4 = [(NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  if ([(NSMutableArray *)self->_setupFields count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_setupFields, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v8 = self->_setupFields;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"setupFields"];
  }
  product = self->_product;
  if (product)
  {
    v15 = [(NPKProtoStandalonePaymentSetupProduct *)product dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"product"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContextReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_setupFields;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_product) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_title) {
    objc_msgSend(v8, "setTitle:");
  }
  if (self->_subtitle) {
    objc_msgSend(v8, "setSubtitle:");
  }
  if ([(NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *)self setupFieldsCount])
  {
    [v8 clearSetupFields];
    unint64_t v4 = [(NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *)self setupFieldsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *)self setupFieldsAtIndex:i];
        [v8 addSetupFields:v7];
      }
    }
  }
  if (self->_product) {
    objc_msgSend(v8, "setProduct:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_subtitle copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v10 = self->_setupFields;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "copyWithZone:", a3, (void)v19);
        [v5 addSetupFields:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  id v16 = [(NPKProtoStandalonePaymentSetupProduct *)self->_product copyWithZone:a3];
  long long v17 = (void *)v5[1];
  v5[1] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((title = self->_title, !((unint64_t)title | v4[4]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((subtitle = self->_subtitle, !((unint64_t)subtitle | v4[3]))
     || -[NSString isEqual:](subtitle, "isEqual:"))
    && ((setupFields = self->_setupFields, !((unint64_t)setupFields | v4[2]))
     || -[NSMutableArray isEqual:](setupFields, "isEqual:")))
  {
    product = self->_product;
    if ((unint64_t)product | v4[1]) {
      char v9 = -[NPKProtoStandalonePaymentSetupProduct isEqual:](product, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_subtitle hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_setupFields hash];
  return v4 ^ v5 ^ [(NPKProtoStandalonePaymentSetupProduct *)self->_product hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 3)) {
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext setSubtitle:](self, "setSubtitle:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext addSetupFields:](self, "addSetupFields:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  product = self->_product;
  uint64_t v11 = *((void *)v4 + 1);
  if (product)
  {
    if (v11) {
      -[NPKProtoStandalonePaymentSetupProduct mergeFrom:](product, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext setProduct:](self, "setProduct:");
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSMutableArray)setupFields
{
  return self->_setupFields;
}

- (void)setSetupFields:(id)a3
{
}

- (NPKProtoStandalonePaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_setupFields, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
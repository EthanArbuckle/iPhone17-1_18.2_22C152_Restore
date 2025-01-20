@interface PKProtobufShippingMethods
+ (Class)methodsType;
- (BOOL)hasDefaultMethod;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)methods;
- (PKProtobufShippingMethod)defaultMethod;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)methodsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)methodsCount;
- (void)addMethods:(id)a3;
- (void)clearMethods;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDefaultMethod:(id)a3;
- (void)setMethods:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufShippingMethods

- (void)clearMethods
{
}

- (void)addMethods:(id)a3
{
  id v4 = a3;
  methods = self->_methods;
  id v8 = v4;
  if (!methods)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_methods;
    self->_methods = v6;

    id v4 = v8;
    methods = self->_methods;
  }
  [(NSMutableArray *)methods addObject:v4];
}

- (unint64_t)methodsCount
{
  return [(NSMutableArray *)self->_methods count];
}

- (id)methodsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_methods objectAtIndex:a3];
}

+ (Class)methodsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDefaultMethod
{
  return self->_defaultMethod != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufShippingMethods;
  id v4 = [(PKProtobufShippingMethods *)&v8 description];
  v5 = [(PKProtobufShippingMethods *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_methods count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_methods, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_methods;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"methods"];
  }
  defaultMethod = self->_defaultMethod;
  if (defaultMethod)
  {
    v12 = [(PKProtobufShippingMethod *)defaultMethod dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"defaultMethod"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufShippingMethodsReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_methods;
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

  if (self->_defaultMethod) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(PKProtobufShippingMethods *)self methodsCount])
  {
    [v8 clearMethods];
    unint64_t v4 = [(PKProtobufShippingMethods *)self methodsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PKProtobufShippingMethods *)self methodsAtIndex:i];
        [v8 addMethods:v7];
      }
    }
  }
  if (self->_defaultMethod) {
    objc_msgSend(v8, "setDefaultMethod:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_methods;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addMethods:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v12 = [(PKProtobufShippingMethod *)self->_defaultMethod copyWithZone:a3];
  long long v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((methods = self->_methods, !((unint64_t)methods | v4[2]))
     || -[NSMutableArray isEqual:](methods, "isEqual:")))
  {
    defaultMethod = self->_defaultMethod;
    if ((unint64_t)defaultMethod | v4[1]) {
      char v7 = -[PKProtobufShippingMethod isEqual:](defaultMethod, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_methods hash];
  return [(PKProtobufShippingMethod *)self->_defaultMethod hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4[2];
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
        -[PKProtobufShippingMethods addMethods:](self, "addMethods:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  defaultMethod = self->_defaultMethod;
  id v11 = v4[1];
  if (defaultMethod)
  {
    if (v11) {
      -[PKProtobufShippingMethod mergeFrom:](defaultMethod, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[PKProtobufShippingMethods setDefaultMethod:](self, "setDefaultMethod:");
  }
}

- (NSMutableArray)methods
{
  return self->_methods;
}

- (void)setMethods:(id)a3
{
}

- (PKProtobufShippingMethod)defaultMethod
{
  return self->_defaultMethod;
}

- (void)setDefaultMethod:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methods, 0);
  objc_storeStrong((id *)&self->_defaultMethod, 0);
}

@end
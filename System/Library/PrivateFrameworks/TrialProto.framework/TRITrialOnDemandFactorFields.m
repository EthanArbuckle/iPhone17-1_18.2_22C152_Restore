@interface TRITrialOnDemandFactorFields
- (BOOL)hasFactorName;
- (BOOL)hasNamespaceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)factorName;
- (NSString)namespaceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFactorName:(id)a3;
- (void)setNamespaceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRITrialOnDemandFactorFields

- (BOOL)hasFactorName
{
  return self->_factorName != 0;
}

- (BOOL)hasNamespaceName
{
  return self->_namespaceName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRITrialOnDemandFactorFields;
  v4 = [(TRITrialOnDemandFactorFields *)&v8 description];
  v5 = [(TRITrialOnDemandFactorFields *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  factorName = self->_factorName;
  if (factorName) {
    [v3 setObject:factorName forKey:@"factor_name"];
  }
  namespaceName = self->_namespaceName;
  if (namespaceName) {
    [v4 setObject:namespaceName forKey:@"namespace_name"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialOnDemandFactorFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_factorName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_namespaceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_factorName)
  {
    objc_msgSend(v4, "setFactorName:");
    id v4 = v5;
  }
  if (self->_namespaceName)
  {
    objc_msgSend(v5, "setNamespaceName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_factorName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_namespaceName copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((factorName = self->_factorName, !((unint64_t)factorName | v4[1]))
     || -[NSString isEqual:](factorName, "isEqual:")))
  {
    namespaceName = self->_namespaceName;
    if ((unint64_t)namespaceName | v4[2]) {
      char v7 = -[NSString isEqual:](namespaceName, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_factorName hash];
  return [(NSString *)self->_namespaceName hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[TRITrialOnDemandFactorFields setFactorName:](self, "setFactorName:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[TRITrialOnDemandFactorFields setNamespaceName:](self, "setNamespaceName:");
    id v4 = v5;
  }
}

- (NSString)factorName
{
  return self->_factorName;
}

- (void)setFactorName:(id)a3
{
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (void)setNamespaceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_factorName, 0);
}

@end
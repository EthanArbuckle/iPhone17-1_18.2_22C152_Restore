@interface TPPBPolicyKeyViewMapping
+ (id)TPPBPolicyKeyViewMappingWithView:(id)a3 matchingRule:(id)a4;
- (BOOL)hasMatchingRule;
- (BOOL)hasView;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)view;
- (TPPBDictionaryMatchingRule)matchingRule;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMatchingRule:(id)a3;
- (void)setView:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyKeyViewMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_matchingRule, 0);
}

- (void)setView:(id)a3
{
}

- (NSString)view
{
  return self->_view;
}

- (void)setMatchingRule:(id)a3
{
}

- (TPPBDictionaryMatchingRule)matchingRule
{
  return self->_matchingRule;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  matchingRule = self->_matchingRule;
  uint64_t v6 = v4[1];
  v7 = v4;
  if (matchingRule)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[TPPBDictionaryMatchingRule mergeFrom:](matchingRule, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[TPPBPolicyKeyViewMapping setMatchingRule:](self, "setMatchingRule:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2]) {
    -[TPPBPolicyKeyViewMapping setView:](self, "setView:");
  }
  MEMORY[0x270F9A758]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(TPPBDictionaryMatchingRule *)self->_matchingRule hash];
  return [(NSString *)self->_view hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((matchingRule = self->_matchingRule, !((unint64_t)matchingRule | v4[1]))
     || -[TPPBDictionaryMatchingRule isEqual:](matchingRule, "isEqual:")))
  {
    view = self->_view;
    if ((unint64_t)view | v4[2]) {
      char v7 = -[NSString isEqual:](view, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(TPPBDictionaryMatchingRule *)self->_matchingRule copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_view copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_matchingRule)
  {
    objc_msgSend(v4, "setMatchingRule:");
    id v4 = v5;
  }
  if (self->_view)
  {
    objc_msgSend(v5, "setView:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_matchingRule)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_view)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyKeyViewMappingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  matchingRule = self->_matchingRule;
  if (matchingRule)
  {
    id v5 = [(TPPBDictionaryMatchingRule *)matchingRule dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"matching_rule"];
  }
  view = self->_view;
  if (view) {
    [v3 setObject:view forKey:@"view"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBPolicyKeyViewMapping;
  id v4 = [(TPPBPolicyKeyViewMapping *)&v8 description];
  id v5 = [(TPPBPolicyKeyViewMapping *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasView
{
  return self->_view != 0;
}

- (BOOL)hasMatchingRule
{
  return self->_matchingRule != 0;
}

+ (id)TPPBPolicyKeyViewMappingWithView:(id)a3 matchingRule:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = objc_alloc_init(TPPBPolicyKeyViewMapping);
  [(TPPBPolicyKeyViewMapping *)v7 setView:v6];

  [(TPPBPolicyKeyViewMapping *)v7 setMatchingRule:v5];
  return v7;
}

@end
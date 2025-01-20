@interface UPResultCandidateEntity
- (BOOL)isHigherLevelEntity;
- (NSNumber)groupId;
- (NSString)higherLevelChildLabel;
- (NSString)higherLevelParentLabel;
- (NSString)label;
- (NSString)semanticValue;
- (NSString)text;
- (SIRINLUEXTERNALUsoGraph)sharedEntityGraph;
- (UPResultCandidateEntity)initWithRange:(_NSRange)a3 label:(id)a4 text:(id)a5 groupId:(id)a6 semanticValue:(id)a7 sharedEntityGraph:(id)a8;
- (UPResultLeafNode)leafNodeRepresentation;
- (_NSRange)range;
- (id)_indexedLabelRepresentation;
- (id)annotatedEntityFragmentString;
@end

@implementation UPResultCandidateEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEntityGraph, 0);
  objc_storeStrong((id *)&self->_semanticValue, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (SIRINLUEXTERNALUsoGraph)sharedEntityGraph
{
  return (SIRINLUEXTERNALUsoGraph *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)semanticValue
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)groupId
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (_NSRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)annotatedEntityFragmentString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"["];
  [v3 appendString:self->_text];
  objc_msgSend(v3, "appendString:", @"](");
  v4 = [(UPResultCandidateEntity *)self _indexedLabelRepresentation];
  [v3 appendString:v4];

  if (self->_semanticValue)
  {
    [v3 appendString:@":"];
    [v3 appendString:self->_semanticValue];
  }
  [v3 appendString:@""]);
  return v3;
}

- (id)_indexedLabelRepresentation
{
  if (self->_groupId && [(UPResultCandidateEntity *)self isHigherLevelEntity])
  {
    id v3 = (NSString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v4 = [(UPResultCandidateEntity *)self higherLevelParentLabel];
    [(NSString *)v3 appendString:v4];

    [(NSString *)v3 appendString:@"$"];
    v5 = [(UPResultCandidateEntity *)self groupId];
    -[NSString appendFormat:](v3, "appendFormat:", @"%lu", [v5 longValue]);

    [(NSString *)v3 appendString:@"."];
    v6 = [(UPResultCandidateEntity *)self higherLevelChildLabel];
    [(NSString *)v3 appendString:v6];
  }
  else
  {
    id v3 = self->_label;
  }
  return v3;
}

- (NSString)higherLevelChildLabel
{
  uint64_t v3 = [(NSString *)self->_label rangeOfString:@"."];
  uint64_t v5 = v3 + v4;
  label = self->_label;
  return [(NSString *)label substringFromIndex:v5];
}

- (NSString)higherLevelParentLabel
{
  uint64_t v3 = [(NSString *)self->_label rangeOfString:@"."];
  label = self->_label;
  return [(NSString *)label substringToIndex:v3];
}

- (BOOL)isHigherLevelEntity
{
  return [(NSString *)self->_label containsString:@"."];
}

- (UPResultLeafNode)leafNodeRepresentation
{
  NSUInteger v2 = [[UPResultLeafNode alloc] initWithLabel:self->_label andText:self->_text andSemanticValue:self->_semanticValue];
  return v2;
}

- (UPResultCandidateEntity)initWithRange:(_NSRange)a3 label:(id)a4 text:(id)a5 groupId:(id)a6 semanticValue:(id)a7 sharedEntityGraph:(id)a8
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v22 = a4;
  id v21 = a5;
  id v20 = a6;
  id v15 = a7;
  id v16 = a8;
  v23.receiver = self;
  v23.super_class = (Class)UPResultCandidateEntity;
  v17 = [(UPResultCandidateEntity *)&v23 init];
  v18 = v17;
  if (v17)
  {
    v17->_range.NSUInteger location = location;
    v17->_range.NSUInteger length = length;
    objc_storeStrong((id *)&v17->_label, a4);
    objc_storeStrong((id *)&v18->_text, a5);
    objc_storeStrong((id *)&v18->_groupId, a6);
    objc_storeStrong((id *)&v18->_semanticValue, a7);
    objc_storeStrong((id *)&v18->_sharedEntityGraph, a8);
  }

  return v18;
}

@end
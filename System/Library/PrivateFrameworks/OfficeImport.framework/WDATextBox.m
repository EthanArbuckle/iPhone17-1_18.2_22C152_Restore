@interface WDATextBox
- (BOOL)isMultiColumn;
- (BOOL)isOle;
- (NSNumber)flowId;
- (NSNumber)flowSequence;
- (WDAContent)parent;
- (WDATextBox)init;
- (WDDocument)document;
- (id)description;
- (id)text;
- (unint64_t)nextTextBoxId;
- (void)setDocument:(id)a3;
- (void)setFlowId:(id)a3;
- (void)setFlowSequence:(id)a3;
- (void)setIsMultiColumn:(BOOL)a3;
- (void)setNextTextBoxId:(unint64_t)a3;
- (void)setOle:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setText:(id)a3;
@end

@implementation WDATextBox

- (WDATextBox)init
{
  v3.receiver = self;
  v3.super_class = (Class)WDATextBox;
  return [(WDATextBox *)&v3 init];
}

- (void)setOle:(BOOL)a3
{
  self->mOle = a3;
}

- (void)setParent:(id)a3
{
}

- (void)setDocument:(id)a3
{
}

- (void)setNextTextBoxId:(unint64_t)a3
{
  self->mNextTextBoxId = a3;
}

- (WDAContent)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParent);
  return (WDAContent *)WeakRetained;
}

- (id)text
{
  return self->mText;
}

- (WDDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  return (WDDocument *)WeakRetained;
}

- (void)setText:(id)a3
{
}

- (BOOL)isOle
{
  return self->mOle;
}

- (unint64_t)nextTextBoxId
{
  return self->mNextTextBoxId;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDATextBox;
  v2 = [(WDATextBox *)&v4 description];
  return v2;
}

- (NSNumber)flowSequence
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFlowSequence:(id)a3
{
}

- (NSNumber)flowId
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFlowId:(id)a3
{
}

- (BOOL)isMultiColumn
{
  return self->_isMultiColumn;
}

- (void)setIsMultiColumn:(BOOL)a3
{
  self->_isMultiColumn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowId, 0);
  objc_storeStrong((id *)&self->_flowSequence, 0);
  objc_destroyWeak((id *)&self->mParent);
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mText, 0);
}

@end
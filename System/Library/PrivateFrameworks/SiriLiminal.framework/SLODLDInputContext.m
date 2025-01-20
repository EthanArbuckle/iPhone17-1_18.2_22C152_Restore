@interface SLODLDInputContext
- (NSArray)prevTokens;
- (NSData)prevEmb;
- (NSNumber)inputAnchor;
- (NSNumber)inputOrigin;
- (NSString)inputUtt;
- (SLODLDInputContext)initWithInputOrigin:(id)a3 inputAnchor:(id)a4 prevTokens:(id)a5 prevEmb:(id)a6;
- (id)description;
- (void)updateWithInputUtt:(id)a3;
@end

@implementation SLODLDInputContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevTokens, 0);
  objc_storeStrong((id *)&self->_prevEmb, 0);
  objc_storeStrong((id *)&self->_inputAnchor, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_inputUtt, 0);
}

- (NSArray)prevTokens
{
  return self->_prevTokens;
}

- (NSData)prevEmb
{
  return self->_prevEmb;
}

- (NSNumber)inputAnchor
{
  return self->_inputAnchor;
}

- (NSNumber)inputOrigin
{
  return self->_inputOrigin;
}

- (NSString)inputUtt
{
  return self->_inputUtt;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Utterance: %@ Input Origin: %@, Input Anchor %@, Prev tokens %@", self->_inputUtt, self->_inputOrigin, self->_inputAnchor, self->_prevTokens];
}

- (void)updateWithInputUtt:(id)a3
{
}

- (SLODLDInputContext)initWithInputOrigin:(id)a3 inputAnchor:(id)a4 prevTokens:(id)a5 prevEmb:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SLODLDInputContext;
  v15 = [(SLODLDInputContext *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_inputOrigin, a3);
    objc_storeStrong((id *)&v16->_inputAnchor, a4);
    uint64_t v17 = [v13 copy];
    prevTokens = v16->_prevTokens;
    v16->_prevTokens = (NSArray *)v17;

    uint64_t v19 = [v14 copy];
    prevEmb = v16->_prevEmb;
    v16->_prevEmb = (NSData *)v19;
  }
  return v16;
}

@end
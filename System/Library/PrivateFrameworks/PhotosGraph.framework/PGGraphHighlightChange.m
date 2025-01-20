@interface PGGraphHighlightChange
- (NSString)highlightUUID;
- (PGGraphHighlightChange)initWithHighlightUUID:(id)a3 updateTypes:(unint64_t)a4;
- (id)description;
- (unint64_t)type;
- (unint64_t)updateTypes;
- (void)mergeChange:(id)a3;
@end

@implementation PGGraphHighlightChange

- (void).cxx_destruct
{
}

- (unint64_t)updateTypes
{
  return self->_updateTypes;
}

- (NSString)highlightUUID
{
  return self->_highlightUUID;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphHighlightChange;
  v4 = [(PGGraphChange *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ [highlightUUID:%@]", v4, self->_highlightUUID];

  return v5;
}

- (void)mergeChange:(id)a3
{
  unint64_t updateTypes = self->_updateTypes;
  self->_unint64_t updateTypes = [a3 updateTypes] | updateTypes;
}

- (unint64_t)type
{
  return 9;
}

- (PGGraphHighlightChange)initWithHighlightUUID:(id)a3 updateTypes:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphHighlightChange;
  v8 = [(PGGraphHighlightChange *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_highlightUUID, a3);
    v9->_unint64_t updateTypes = a4;
  }

  return v9;
}

@end
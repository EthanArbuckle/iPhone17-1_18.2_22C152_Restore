@interface PGGraphHighlightsDeletion
- (NSSet)highlightUUIDs;
- (PGGraphHighlightsDeletion)initWithHighlightUUIDs:(id)a3;
- (id)description;
- (unint64_t)changeCount;
- (unint64_t)type;
@end

@implementation PGGraphHighlightsDeletion

- (void).cxx_destruct
{
}

- (NSSet)highlightUUIDs
{
  return self->_highlightUUIDs;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphHighlightsDeletion;
  v4 = [(PGGraphChange *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, highlightUUIDs (%ld): %@", v4, -[NSSet count](self->_highlightUUIDs, "count"), self->_highlightUUIDs];

  return v5;
}

- (unint64_t)changeCount
{
  return [(NSSet *)self->_highlightUUIDs count];
}

- (unint64_t)type
{
  return 8;
}

- (PGGraphHighlightsDeletion)initWithHighlightUUIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphHighlightsDeletion;
  v6 = [(PGGraphHighlightsDeletion *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_highlightUUIDs, a3);
  }

  return v7;
}

@end
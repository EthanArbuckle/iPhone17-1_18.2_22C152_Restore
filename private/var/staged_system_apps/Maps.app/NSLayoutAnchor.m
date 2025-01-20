@interface NSLayoutAnchor
- (NSString)maps_uniqueKey;
- (id)constraintEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5;
- (id)constraintGreaterThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5;
- (id)constraintLessThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5;
@end

@implementation NSLayoutAnchor

- (id)constraintEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5
{
  v6 = [(NSLayoutAnchor *)self constraintEqualToAnchor:a3 constant:a4];
  *(float *)&double v7 = a5;
  [v6 setPriority:v7];

  return v6;
}

- (id)constraintLessThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5
{
  v6 = [(NSLayoutAnchor *)self constraintLessThanOrEqualToAnchor:a3 constant:a4];
  *(float *)&double v7 = a5;
  [v6 setPriority:v7];

  return v6;
}

- (id)constraintGreaterThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5
{
  v6 = [(NSLayoutAnchor *)self constraintGreaterThanOrEqualToAnchor:a3 constant:a4];
  *(float *)&double v7 = a5;
  [v6 setPriority:v7];

  return v6;
}

- (NSString)maps_uniqueKey
{
  return +[NSString stringWithFormat:@"%p", self];
}

@end
@interface PSIRankedGroup
- (PSIGroup)group;
- (PSIRankedGroup)initWithGroup:(id)a3 score:(double)a4;
- (double)score;
- (void)setScore:(double)a3;
@end

@implementation PSIRankedGroup

- (void).cxx_destruct
{
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (PSIGroup)group
{
  return self->_group;
}

- (PSIRankedGroup)initWithGroup:(id)a3 score:(double)a4
{
  id v7 = a3;
  v8 = [(PSIRankedGroup *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_group, a3);
    v9->_score = a4;
  }

  return v9;
}

@end
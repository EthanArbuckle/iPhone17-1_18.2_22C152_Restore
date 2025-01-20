@interface _PSPhotosShareInformation
- (_PSPhotosShareInformation)initWithInteractionCount:(unint64_t)a3 totalInteractionCount:(unint64_t)a4;
- (unint64_t)interactionCount;
- (unint64_t)totalInteractionCount;
@end

@implementation _PSPhotosShareInformation

- (_PSPhotosShareInformation)initWithInteractionCount:(unint64_t)a3 totalInteractionCount:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_PSPhotosShareInformation;
  result = [(_PSPhotosShareInformation *)&v7 init];
  if (result)
  {
    result->_interactionCount = a3;
    result->_totalInteractionCount = a4;
  }
  return result;
}

- (unint64_t)interactionCount
{
  return self->_interactionCount;
}

- (unint64_t)totalInteractionCount
{
  return self->_totalInteractionCount;
}

@end
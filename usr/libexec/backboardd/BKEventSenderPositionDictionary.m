@interface BKEventSenderPositionDictionary
- (id)description;
@end

@implementation BKEventSenderPositionDictionary

- (void).cxx_destruct
{
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:self];
}

@end
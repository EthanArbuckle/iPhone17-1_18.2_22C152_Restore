@interface _UINullFeedback
+ (BOOL)supportsSecureCoding;
+ (id)nullFeedback;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighPriority;
- (_UINullFeedback)init;
- (_UINullFeedback)initWithDictionaryRepresentation:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)_effectivePlayableFeedbackTypes;
@end

@implementation _UINullFeedback

+ (id)nullFeedback
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (_UINullFeedback)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UINullFeedback;
  id v2 = [(_UIFeedback *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UINullFeedback;
  if ([(_UIFeedback *)&v7 isEqual:v4]) {
    char v5 = [(NSUUID *)self->_uuid isEqual:v4[16]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (_UINullFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UINullFeedback;
  char v5 = [(_UIFeedback *)&v12 initWithDictionaryRepresentation:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    objc_super v7 = [v4 objectForKeyedSubscript:@"UUID"];
    uint64_t v8 = [v6 initWithUUIDString:v7];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v7.receiver = self;
  v7.super_class = (Class)_UINullFeedback;
  uint64_t v3 = [(_UIFeedback *)&v7 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  char v5 = [(NSUUID *)self->_uuid UUIDString];
  [v4 setObject:v5 forKeyedSubscript:@"UUID"];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"NULL";
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  return 0;
}

- (BOOL)isHighPriority
{
  return 0;
}

- (void).cxx_destruct
{
}

@end
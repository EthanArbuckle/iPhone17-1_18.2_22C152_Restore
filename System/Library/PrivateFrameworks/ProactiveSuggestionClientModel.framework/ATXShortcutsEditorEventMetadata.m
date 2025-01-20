@interface ATXShortcutsEditorEventMetadata
+ (BOOL)supportsSecureCoding;
- (ATXShortcutsEditorEventMetadata)initWithCoder:(id)a3;
- (ATXShortcutsEditorEventMetadata)initWithNumStepsInShortcut:(unint64_t)a3;
- (ATXShortcutsEditorEventMetadata)initWithProto:(id)a3;
- (ATXShortcutsEditorEventMetadata)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXShortcutsEditorEventMetadata:(id)a3;
- (id)encodeAsProto;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unint64_t)numStepsInShortcut;
- (void)encodeWithCoder:(id)a3;
- (void)setNumStepsInShortcut:(unint64_t)a3;
@end

@implementation ATXShortcutsEditorEventMetadata

- (ATXShortcutsEditorEventMetadata)initWithNumStepsInShortcut:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ATXShortcutsEditorEventMetadata;
  v4 = [(ATXShortcutsEditorEventMetadata *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    proto = v4->_proto;
    v4->_proto = (ATXPBShortcutsEditorEventMetadata *)v5;

    [(ATXPBShortcutsEditorEventMetadata *)v4->_proto setNumStepsInShortcut:a3];
  }
  return v4;
}

- (unint64_t)numStepsInShortcut
{
  return [(ATXPBShortcutsEditorEventMetadata *)self->_proto numStepsInShortcut];
}

- (void)setNumStepsInShortcut:(unint64_t)a3
{
}

- (id)encodeAsProto
{
  return (id)[(ATXPBShortcutsEditorEventMetadata *)self->_proto data];
}

- (ATXShortcutsEditorEventMetadata)initWithProto:(id)a3
{
  uint64_t v4 = [a3 numStepsInShortcut];
  return [(ATXShortcutsEditorEventMetadata *)self initWithNumStepsInShortcut:v4];
}

- (ATXShortcutsEditorEventMetadata)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[ATXPBShortcutsEditorEventMetadata alloc] initWithData:v4];

    self = [(ATXShortcutsEditorEventMetadata *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  return self->_proto;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXShortcutsEditorEventMetadata *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXShortcutsEditorEventMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXShortcutsEditorEventMetadata *)self initWithProtoData:v5];
  return v6;
}

- (unint64_t)hash
{
  return [(ATXPBShortcutsEditorEventMetadata *)self->_proto hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXShortcutsEditorEventMetadata *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXShortcutsEditorEventMetadata *)self isEqualToATXShortcutsEditorEventMetadata:v5];

  return v6;
}

- (BOOL)isEqualToATXShortcutsEditorEventMetadata:(id)a3
{
  return [(ATXPBShortcutsEditorEventMetadata *)self->_proto isEqual:*((void *)a3 + 1)];
}

- (id)jsonDict
{
  return [(ATXPBShortcutsEditorEventMetadata *)self->_proto dictionaryRepresentation];
}

- (void).cxx_destruct
{
}

@end
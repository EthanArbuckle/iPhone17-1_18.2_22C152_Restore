@interface MRSendCommandHandlerDialogAction
+ (id)actionWithTitle:(id)a3 type:(int64_t)a4 commandEvent:(id)a5;
- (MRSendCommandHandlerDialogAction)initWithProtobuf:(id)a3;
- (MRSendCommandHandlerDialogAction)initWithTitle:(id)a3 type:(int64_t)a4 commandEvent:(id)a5;
- (MRSendCommandHandlerEvent)event;
- (NSString)title;
- (_MRSendCommandResultHandlerDialogActionProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
@end

@implementation MRSendCommandHandlerDialogAction

+ (id)actionWithTitle:(id)a3 type:(int64_t)a4 commandEvent:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithTitle:v9 type:a4 commandEvent:v8];

  return v10;
}

- (MRSendCommandHandlerDialogAction)initWithTitle:(id)a3 type:(int64_t)a4 commandEvent:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRSendCommandHandlerDialogAction;
  v11 = [(MRSendCommandHandlerDialogAction *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_event, a5);
  }

  return v12;
}

- (MRSendCommandHandlerDialogAction)initWithProtobuf:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 title];
    uint64_t v6 = (int)[v4 type];
    v7 = [MRSendCommandHandlerEvent alloc];
    id v8 = [v4 event];

    id v9 = [(MRSendCommandHandlerEvent *)v7 initWithProtobuf:v8];
    self = [(MRSendCommandHandlerDialogAction *)self initWithTitle:v5 type:v6 commandEvent:v9];

    id v10 = self;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (_MRSendCommandResultHandlerDialogActionProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRSendCommandResultHandlerDialogActionProtobuf);
  id v4 = [(MRSendCommandHandlerDialogAction *)self title];
  [(_MRSendCommandResultHandlerDialogActionProtobuf *)v3 setTitle:v4];

  [(_MRSendCommandResultHandlerDialogActionProtobuf *)v3 setType:[(MRSendCommandHandlerDialogAction *)self type]];
  v5 = [(MRSendCommandHandlerDialogAction *)self event];
  uint64_t v6 = [v5 protobuf];
  [(_MRSendCommandResultHandlerDialogActionProtobuf *)v3 setEvent:v6];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(MRSendCommandHandlerDialogAction *)self title];
  v7 = (void *)[v6 copyWithZone:a3];
  int64_t v8 = [(MRSendCommandHandlerDialogAction *)self type];
  id v9 = [(MRSendCommandHandlerDialogAction *)self event];
  id v10 = (void *)[v9 copyWithZone:a3];
  v11 = (void *)[v5 initWithTitle:v7 type:v8 commandEvent:v10];

  return v11;
}

- (id)description
{
  unint64_t v3 = [(MRSendCommandHandlerDialogAction *)self type];
  if (v3 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E57D3DF0[v3];
  }
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = [(MRSendCommandHandlerDialogAction *)self title];
  int64_t v8 = [(MRSendCommandHandlerDialogAction *)self event];
  id v9 = MRCreateIndentedDebugDescriptionFromObject(v8);
  id v10 = [v5 stringWithFormat:@"<%@ : %p {\n   title= %@\n   type= %@\n   event= %@\n}>\n", v6, self, v7, v4, v9];

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (MRSendCommandHandlerEvent)event
{
  return self->_event;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
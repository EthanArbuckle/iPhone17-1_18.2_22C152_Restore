@interface MRSendCommandHandlerDialog
+ (id)dialogWithTitle:(id)a3 message:(id)a4;
- (MRSendCommandHandlerDialog)initWithProtobuf:(id)a3;
- (MRSendCommandHandlerDialog)initWithTitle:(id)a3 message:(id)a4;
- (NSArray)actions;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
- (_MRSendCommandResultHandlerDialogProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addAction:(id)a3;
- (void)setLocalizedMessage:(id)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation MRSendCommandHandlerDialog

+ (id)dialogWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithTitle:v7 message:v6];

  return v8;
}

- (MRSendCommandHandlerDialog)initWithTitle:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRSendCommandHandlerDialog;
  v9 = [(MRSendCommandHandlerDialog *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedTitle, a3);
    objc_storeStrong((id *)&v10->_localizedMessage, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableActions = v10->_mutableActions;
    v10->_mutableActions = v11;
  }
  return v10;
}

- (MRSendCommandHandlerDialog)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)MRSendCommandHandlerDialog;
    v5 = [(MRSendCommandHandlerDialog *)&v16 init];
    if (v5)
    {
      uint64_t v6 = [v4 localizedTitle];
      localizedTitle = v5->_localizedTitle;
      v5->_localizedTitle = (NSString *)v6;

      uint64_t v8 = [v4 localizedMessage];
      localizedMessage = v5->_localizedMessage;
      v5->_localizedMessage = (NSString *)v8;

      v10 = [v4 actions];
      v11 = objc_msgSend(v10, "msv_map:", &__block_literal_global_42);
      uint64_t v12 = [v11 mutableCopy];
      mutableActions = v5->_mutableActions;
      v5->_mutableActions = (NSMutableArray *)v12;
    }
    self = v5;
    objc_super v14 = self;
  }
  else
  {
    objc_super v14 = 0;
  }

  return v14;
}

MRSendCommandHandlerDialogAction *__47__MRSendCommandHandlerDialog_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRSendCommandHandlerDialogAction alloc] initWithProtobuf:v2];

  return v3;
}

- (_MRSendCommandResultHandlerDialogProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRSendCommandResultHandlerDialogProtobuf);
  id v4 = [(MRSendCommandHandlerDialog *)self localizedTitle];
  [(_MRSendCommandResultHandlerDialogProtobuf *)v3 setLocalizedTitle:v4];

  v5 = [(MRSendCommandHandlerDialog *)self localizedMessage];
  [(_MRSendCommandResultHandlerDialogProtobuf *)v3 setLocalizedMessage:v5];

  uint64_t v6 = [(MRSendCommandHandlerDialog *)self actions];
  id v7 = objc_msgSend(v6, "msv_map:", &__block_literal_global_78);
  uint64_t v8 = (void *)[v7 mutableCopy];
  [(_MRSendCommandResultHandlerDialogProtobuf *)v3 setActions:v8];

  return v3;
}

uint64_t __38__MRSendCommandHandlerDialog_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

- (void)addAction:(id)a3
{
}

- (NSArray)actions
{
  id v2 = (void *)[(NSMutableArray *)self->_mutableActions copy];

  return (NSArray *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(MRSendCommandHandlerDialog *)self localizedTitle];
  id v7 = (void *)[v6 copyWithZone:a3];
  uint64_t v8 = [(MRSendCommandHandlerDialog *)self localizedMessage];
  v9 = (void *)[v8 copyWithZone:a3];
  v10 = (void *)[v5 initWithTitle:v7 message:v9];

  uint64_t v11 = [(NSMutableArray *)self->_mutableActions copyWithZone:a3];
  uint64_t v12 = (void *)v10[1];
  v10[1] = v11;

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MRSendCommandHandlerDialog *)self localizedTitle];
  uint64_t v6 = [(MRSendCommandHandlerDialog *)self localizedMessage];
  id v7 = [(MRSendCommandHandlerDialog *)self actions];
  uint64_t v8 = MRCreateIndentedDebugDescriptionFromArray(v7);
  v9 = [v3 stringWithFormat:@"<%@ : %p {\n   title= %@\n   message= %@\n   actions= %@\n}>\n", v4, self, v5, v6, v8];

  return v9;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void)setLocalizedMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);

  objc_storeStrong((id *)&self->_mutableActions, 0);
}

@end
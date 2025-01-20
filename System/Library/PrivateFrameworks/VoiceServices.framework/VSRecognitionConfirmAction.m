@interface VSRecognitionConfirmAction
- (VSRecognitionConfirmAction)init;
- (VSRecognitionConfirmAction)initWithModelIdentifier:(id)a3;
- (id)confirmedAction;
- (id)deniedAction;
- (int)completionType;
- (void)_setConfirmed:(BOOL)a3;
- (void)dealloc;
- (void)setConfirmedAction:(id)a3;
- (void)setDeniedAction:(id)a3;
@end

@implementation VSRecognitionConfirmAction

- (id)deniedAction
{
  return self->_deniedAction;
}

- (void)setDeniedAction:(id)a3
{
  deniedAction = self->_deniedAction;
  if (deniedAction != a3)
  {

    self->_deniedAction = (VSRecognitionAction *)a3;
  }
}

- (id)confirmedAction
{
  return self->_confirmedAction;
}

- (void)setConfirmedAction:(id)a3
{
  confirmedAction = self->_confirmedAction;
  if (confirmedAction != a3)
  {

    self->_confirmedAction = (VSRecognitionAction *)a3;
  }
}

- (void)_setConfirmed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_confirmFlags = *(unsigned char *)&self->_confirmFlags & 0xFD | v3;
}

- (int)completionType
{
  v5.receiver = self;
  v5.super_class = (Class)VSRecognitionConfirmAction;
  int result = [(VSRecognitionRecognizeAction *)&v5 completionType];
  if ((*(unsigned char *)&self->_confirmFlags & 2) != 0) {
    uint64_t v4 = 112;
  }
  else {
    uint64_t v4 = 120;
  }
  if (!*(Class *)((char *)&self->super.super.super.isa + v4)) {
    return 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VSRecognitionConfirmAction;
  [(VSRecognitionRecognizeAction *)&v3 dealloc];
}

- (VSRecognitionConfirmAction)initWithModelIdentifier:(id)a3
{
  *(unsigned char *)&self->_confirmFlags |= 1u;
  v4.receiver = self;
  v4.super_class = (Class)VSRecognitionConfirmAction;
  int result = [(VSRecognitionRecognizeAction *)&v4 initWithModelIdentifier:@"com.apple.yn"];
  *(unsigned char *)&result->_confirmFlags &= ~1u;
  return result;
}

- (VSRecognitionConfirmAction)init
{
  if (*(unsigned char *)&self->_confirmFlags)
  {
    v4.receiver = self;
    v4.super_class = (Class)VSRecognitionConfirmAction;
    return [(VSRecognitionConfirmAction *)&v4 init];
  }
  else
  {
    *(unsigned char *)&self->_confirmFlags |= 1u;
    v3.receiver = self;
    v3.super_class = (Class)VSRecognitionConfirmAction;
    int result = [(VSRecognitionRecognizeAction *)&v3 initWithModelIdentifier:@"com.apple.yn"];
    *(unsigned char *)&result->_confirmFlags &= ~1u;
  }
  return result;
}

@end
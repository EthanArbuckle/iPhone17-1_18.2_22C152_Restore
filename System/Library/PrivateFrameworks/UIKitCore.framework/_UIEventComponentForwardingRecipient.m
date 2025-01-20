@interface _UIEventComponentForwardingRecipient
- (UIResponder)responder;
- (id)description;
- (void)setResponder:(id)a3;
@end

@implementation _UIEventComponentForwardingRecipient

- (UIResponder)responder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->responder);
  return (UIResponder *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->responder);
  objc_destroyWeak((id *)&self->fromResponder);
}

- (id)description
{
  v3 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)_UIEventComponentForwardingRecipient;
  v4 = [(_UIEventComponentForwardingRecipient *)&v16 description];
  v5 = @"moved";
  v6 = @"cancelled";
  int64_t recordedPhase = self->recordedPhase;
  int64_t autocompletedPhase = self->autocompletedPhase;
  if (recordedPhase == 3) {
    v9 = @"ended";
  }
  else {
    v9 = @"cancelled";
  }
  if (recordedPhase != 1) {
    v5 = v9;
  }
  if (recordedPhase) {
    v10 = v5;
  }
  else {
    v10 = @"began";
  }
  if (autocompletedPhase == 3) {
    v6 = @"ended";
  }
  if (autocompletedPhase == 1) {
    v6 = @"moved";
  }
  if (autocompletedPhase) {
    v11 = v6;
  }
  else {
    v11 = @"began";
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->responder);
  id v13 = objc_loadWeakRetained((id *)&self->fromResponder);
  v14 = [v3 stringWithFormat:@"%@ - recorded phase = %@, autocompleted phase = %@, to responder: %@, from responder: %@", v4, v10, v11, WeakRetained, v13];

  return v14;
}

- (void)setResponder:(id)a3
{
}

@end
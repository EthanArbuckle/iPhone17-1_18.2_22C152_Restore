@interface _UIDropInteractionWeakWrapper
- (UIDropInteraction)dropInteraction;
- (_UIDropInteractionWeakWrapper)initWithDropInteraction:(id)a3;
@end

@implementation _UIDropInteractionWeakWrapper

- (_UIDropInteractionWeakWrapper)initWithDropInteraction:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDropInteractionWeakWrapper;
  v5 = [(_UIDropInteractionWeakWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dropInteraction, v4);
  }

  return v6;
}

- (UIDropInteraction)dropInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropInteraction);
  return (UIDropInteraction *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
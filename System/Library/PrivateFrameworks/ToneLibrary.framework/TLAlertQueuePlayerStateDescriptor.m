@interface TLAlertQueuePlayerStateDescriptor
- (BOOL)isAlertActivationAssertionAcquired;
- (TLAlert)alertForAudioEnvironmentSetup;
- (TLAlert)playingAlert;
- (TLAlertQueuePlayerStateDescriptor)initWithPlayingAlert:(id)a3 completionHandler:(id)a4 previousStateDescriptor:(id)a5;
- (id)_descriptionForDebugging:(BOOL)a3;
- (id)_initForRelinquishingActivationAssertionWithAlertForAudioEnvironmentSetup:(id)a3 previousStateDescriptor:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)initForAcquiringActivationAssertionWithAlertForAudioEnvironmentSetup:(id)a3 previousStateDescriptor:(id)a4;
- (id)playingAlertCompletionHandler;
- (id)stateDescriptorByRelinquishingActivationAssertion;
- (id)stateDescriptorForCompletedPlayback;
- (void)_transferPlayingAlertAndCompletionHandlerFromPreviousStateDescriptor:(id)a3;
- (void)invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:(int64_t)a3 error:(id)a4;
- (void)setAlertActivationAssertionAcquired:(BOOL)a3;
- (void)setAlertForAudioEnvironmentSetup:(id)a3;
@end

@implementation TLAlertQueuePlayerStateDescriptor

- (TLAlertQueuePlayerStateDescriptor)initWithPlayingAlert:(id)a3 completionHandler:(id)a4 previousStateDescriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TLAlertQueuePlayerStateDescriptor;
  v12 = [(TLAlertQueuePlayerStateDescriptor *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_playingAlert, a3);
    uint64_t v14 = [v10 copy];
    id playingAlertCompletionHandler = v13->_playingAlertCompletionHandler;
    v13->_id playingAlertCompletionHandler = (id)v14;

    if ([v11 isAlertActivationAssertionAcquired])
    {
      v13->_isAlertActivationAssertionAcquired = 1;
      v16 = [v11 alertForAudioEnvironmentSetup];
    }
    else
    {
      v16 = (TLAlert *)v9;
    }
    alertForAudioEnvironmentSetup = v13->_alertForAudioEnvironmentSetup;
    v13->_alertForAudioEnvironmentSetup = v16;
  }
  return v13;
}

- (id)stateDescriptorForCompletedPlayback
{
  if (self->_isAlertActivationAssertionAcquired) {
    id v2 = [[TLAlertQueuePlayerStateDescriptor alloc] initForAcquiringActivationAssertionWithAlertForAudioEnvironmentSetup:self->_alertForAudioEnvironmentSetup previousStateDescriptor:0];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)initForAcquiringActivationAssertionWithAlertForAudioEnvironmentSetup:(id)a3 previousStateDescriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TLAlertQueuePlayerStateDescriptor;
  id v9 = [(TLAlertQueuePlayerStateDescriptor *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alertForAudioEnvironmentSetup, a3);
    v10->_isAlertActivationAssertionAcquired = 1;
    [(TLAlertQueuePlayerStateDescriptor *)v10 _transferPlayingAlertAndCompletionHandlerFromPreviousStateDescriptor:v8];
  }

  return v10;
}

- (id)stateDescriptorByRelinquishingActivationAssertion
{
  playingAlert = self->_playingAlert;
  if (playingAlert)
  {
    v4 = playingAlert;
    id v5 = [[TLAlertQueuePlayerStateDescriptor alloc] _initForRelinquishingActivationAssertionWithAlertForAudioEnvironmentSetup:v4 previousStateDescriptor:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_initForRelinquishingActivationAssertionWithAlertForAudioEnvironmentSetup:(id)a3 previousStateDescriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TLAlertQueuePlayerStateDescriptor;
  id v9 = [(TLAlertQueuePlayerStateDescriptor *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alertForAudioEnvironmentSetup, a3);
    v10->_isAlertActivationAssertionAcquired = 0;
    [(TLAlertQueuePlayerStateDescriptor *)v10 _transferPlayingAlertAndCompletionHandlerFromPreviousStateDescriptor:v8];
  }

  return v10;
}

- (void)_transferPlayingAlertAndCompletionHandlerFromPreviousStateDescriptor:(id)a3
{
  if (a3)
  {
    objc_storeStrong((id *)&self->_playingAlert, *((id *)a3 + 2));
    id v7 = a3;
    id v5 = (void *)MEMORY[0x1E0195470](*((void *)v7 + 3));
    id playingAlertCompletionHandler = self->_playingAlertCompletionHandler;
    self->_id playingAlertCompletionHandler = v5;

    self->_hasInvokedCompletionHandlerForPlayingAlert = *((unsigned char *)v7 + 8);
    *((unsigned char *)v7 + 8) = 1;
  }
}

- (id)_descriptionForDebugging:(BOOL)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = (void *)[v5 initWithFormat:@"<%@: %p", v7, self];

  playingAlert = self->_playingAlert;
  if (a3)
  {
    id v10 = [(TLAlert *)playingAlert debugDescription];
    [v8 appendFormat:@"; playingAlert = %@", v10];
    if (!self->_isAlertActivationAssertionAcquired) {
      goto LABEL_12;
    }
    id v11 = [(TLAlert *)self->_alertForAudioEnvironmentSetup debugDescription];
  }
  else
  {
    if (playingAlert)
    {
      objc_super v12 = NSString;
      v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      id v10 = [v12 stringWithFormat:@"<%@: %p>", v14, self->_playingAlert];
    }
    else
    {
      id v10 = 0;
    }
    [v8 appendFormat:@"; playingAlert = %@", v10];
    if (!self->_isAlertActivationAssertionAcquired) {
      goto LABEL_12;
    }
    if (self->_alertForAudioEnvironmentSetup)
    {
      v15 = NSString;
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      id v11 = [v15 stringWithFormat:@"<%@: %p>", v17, self->_alertForAudioEnvironmentSetup];
    }
    else
    {
      id v11 = 0;
    }
  }
  [v8 appendFormat:@"; alertForAudioEnvironmentSetup = %@", v11];

LABEL_12:
  [v8 appendString:@">"];

  return v8;
}

- (id)description
{
  return [(TLAlertQueuePlayerStateDescriptor *)self _descriptionForDebugging:0];
}

- (id)debugDescription
{
  return [(TLAlertQueuePlayerStateDescriptor *)self _descriptionForDebugging:1];
}

- (void)invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E0195470](self->_playingAlertCompletionHandler);
  if (v7 && !self->_hasInvokedCompletionHandlerForPlayingAlert)
  {
    self->_hasInvokedCompletionHandlerForPlayingAlert = 1;
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__TLAlertQueuePlayerStateDescriptor_invokePlayingAlertCompletionHandlerWithPlaybackCompletionType_error___block_invoke;
    block[3] = &unk_1E6C21BC0;
    id v11 = v7;
    int64_t v12 = a3;
    id v10 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __105__TLAlertQueuePlayerStateDescriptor_invokePlayingAlertCompletionHandlerWithPlaybackCompletionType_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (BOOL)isAlertActivationAssertionAcquired
{
  return self->_isAlertActivationAssertionAcquired;
}

- (void)setAlertActivationAssertionAcquired:(BOOL)a3
{
  self->_isAlertActivationAssertionAcquired = a3;
}

- (TLAlert)playingAlert
{
  return self->_playingAlert;
}

- (id)playingAlertCompletionHandler
{
  return self->_playingAlertCompletionHandler;
}

- (TLAlert)alertForAudioEnvironmentSetup
{
  return self->_alertForAudioEnvironmentSetup;
}

- (void)setAlertForAudioEnvironmentSetup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertForAudioEnvironmentSetup, 0);
  objc_storeStrong(&self->_playingAlertCompletionHandler, 0);

  objc_storeStrong((id *)&self->_playingAlert, 0);
}

@end
@interface MNAudioSessionResourceAccess
+ (BOOL)deviceSpeakerIsInUse;
+ (BOOL)headphonesAreInUse;
- (BOOL)activate;
- (BOOL)deactivate;
- (BOOL)deactivateWithForce:(BOOL)a3;
- (BOOL)updatePropertiesWithOptions:(id)a3 transportType:(int)a4 error:(id *)a5;
- (MNAudioSessionAccessDelegate)delegate;
- (MNAudioSessionResourceAccess)init;
- (id)_stringForAVAudioSessionErrorCode:(int64_t)a3;
- (unint64_t)promptStyle;
- (unint64_t)state;
- (void)_changeNumChannels;
- (void)setDelegate:(id)a3;
@end

@implementation MNAudioSessionResourceAccess

- (MNAudioSessionResourceAccess)init
{
  v8.receiver = self;
  v8.super_class = (Class)MNAudioSessionResourceAccess;
  v2 = [(MNAudioSessionResourceAccess *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Navigation.AudioSessionQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (unint64_t)promptStyle
{
  if (GEOConfigGetBOOL()) {
    return 1936224884;
  }
  v3 = [MEMORY[0x1E4F4E9F0] sharedInstance];
  unint64_t v4 = [v3 promptStyle];

  return v4;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)updatePropertiesWithOptions:(id)a3 transportType:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)([v8 guidanceLevelForTransportType:v6] - 1) > 1)
    {
      uint64_t v10 = 1;
    }
    else if ([v9 pauseSpokenAudio])
    {
      uint64_t v10 = 19;
    }
    else
    {
      uint64_t v10 = 3;
    }
    v14 = GetAudioLogForMNAudioSessionResourceAccessCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v10;
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_INFO, "Ⓓ Setting AVAudioSession category to Playback with options: 0x%x", buf, 8u);
    }

    id v15 = (id)*MEMORY[0x1E4F4E800];
    id v16 = (id)*MEMORY[0x1E4F4E920];
    v17 = [MEMORY[0x1E4F4E9F0] sharedInstance];
    id v25 = 0;
    char v18 = [v17 setCategory:v15 mode:v16 options:v10 error:&v25];
    id v19 = v25;

    if (v19) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v18;
    }
    if (v13)
    {
      [(MNAudioSessionResourceAccess *)self _changeNumChannels];
      v20 = GetAudioLogForMNAudioSessionResourceAccessCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v29 = v15;
        __int16 v30 = 2112;
        id v31 = v16;
        __int16 v32 = 2048;
        uint64_t v33 = v10;
        _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_INFO, "Ⓓ    Successfully set the category (%@), mode (%@), and options (0x%lX)", buf, 0x20u);
      }
    }
    else
    {
      v21 = GetAudioLogForMNAudioSessionResourceAccessCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        id v29 = v15;
        __int16 v30 = 2112;
        id v31 = v16;
        __int16 v32 = 2048;
        uint64_t v33 = v10;
        __int16 v34 = 2112;
        id v35 = v19;
        _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_ERROR, "⒟    Error setting the category (%@), mode (%@), and options (0x%lX) - %@", buf, 0x2Au);
      }

      if (!a5) {
        goto LABEL_23;
      }
      v22 = (void *)MEMORY[0x1E4F28C58];
      v20 = NAVAudioErrorDomain();
      uint64_t v26 = *MEMORY[0x1E4F28A50];
      id v27 = v19;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      *a5 = [v22 errorWithDomain:v20 code:3401 userInfo:v23];
    }
LABEL_23:

    goto LABEL_24;
  }
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    v12 = NAVAudioErrorDomain();
    *a5 = [v11 errorWithDomain:v12 code:3400 userInfo:0];
  }
  BOOL v13 = 0;
LABEL_24:

  return v13;
}

- (void)_changeNumChannels
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F4E9F0] sharedInstance];
  id v18 = 0;
  int v4 = [v3 setPreferredOutputNumberOfChannels:1 error:&v18];
  id v5 = v18;

  uint64_t v6 = GetAudioLogForMNAudioSessionResourceAccessCategory();
  v7 = v6;
  if (v4) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "Ⓓ    Successfully set the channel count", buf, 2u);
    }

    id v16 = [(MNAudioSessionResourceAccess *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v14 = [(MNAudioSessionResourceAccess *)self delegate];
      [v14 audioSessionResourceAccess:self didSetChannelCount:1];
      goto LABEL_13;
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v5;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "⒟    Error setting the channel count: %@", buf, 0xCu);
    }

    v9 = [(MNAudioSessionResourceAccess *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      v12 = NAVAudioErrorDomain();
      uint64_t v19 = *MEMORY[0x1E4F28A50];
      id v20 = v5;
      BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      v14 = [v11 errorWithDomain:v12 code:3404 userInfo:v13];

      id v15 = [(MNAudioSessionResourceAccess *)self delegate];
      [v15 audioSessionResourceAccess:self didFailWhileSettingChannelCount:v14];

LABEL_13:
    }
  }
}

- (BOOL)activate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  if (state == 2)
  {
    uint64_t v6 = GetAudioLogForMNAudioSessionResourceAccessCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unint64_t v7 = self->_state;
      if (v7 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", self->_state);
        BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v8 = off_1E60FB528[v7];
      }
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "Ⓓ Activation ignored : unint64_t state = %@", buf, 0xCu);
    }
  }
  else
  {
    self->_unint64_t state = 1;
    int v4 = GetAudioLogForMNAudioSessionResourceAccessCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "Ⓓ Attempting to activate the audio session", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MNAudioSessionResourceAccess_activate__block_invoke;
    block[3] = &unk_1E60F6B98;
    block[4] = self;
    dispatch_async(queue, block);
  }
  return state != 2;
}

void __40__MNAudioSessionResourceAccess_activate__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F4E9F0] sharedInstance];
  id v13 = 0;
  char v3 = [v2 setActive:1 error:&v13];
  id v4 = v13;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MNAudioSessionResourceAccess_activate__block_invoke_2;
  block[3] = &unk_1E60FB508;
  char v12 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v2;
  id v6 = v2;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __40__MNAudioSessionResourceAccess_activate__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56) && !*(void *)(a1 + 32))
  {
    *(void *)(*(void *)(a1 + 40) + 16) = 2;
    id v11 = GetAudioLogForMNAudioSessionResourceAccessCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "Ⓓ    Audio session activation started", buf, 2u);
    }

    char v12 = [*(id *)(a1 + 40) delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v10 = [*(id *)(a1 + 40) delegate];
      [v10 audioSessionResourceAccess:*(void *)(a1 + 40) didActivateSession:1];
LABEL_14:
    }
  }
  else
  {
    *(void *)(*(void *)(a1 + 40) + 16) = 0;
    v2 = GetAudioLogForMNAudioSessionResourceAccessCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v3;
      _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_ERROR, "⒟    Error activating audio session: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 48) setActive:0 error:0];
    id v4 = [*(id *)(a1 + 40) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      id v7 = NAVAudioErrorDomain();
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8)
      {
        uint64_t v15 = *MEMORY[0x1E4F28A50];
        uint64_t v16 = v8;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        uint64_t v10 = [v6 errorWithDomain:v7 code:3403 userInfo:v9];
      }
      else
      {
        uint64_t v10 = [v6 errorWithDomain:v7 code:3402 userInfo:0];
      }

      v14 = [*(id *)(a1 + 40) delegate];
      [v14 audioSessionResourceAccess:*(void *)(a1 + 40) didFailWhileActivatingSession:v10];

      goto LABEL_14;
    }
  }
}

- (BOOL)deactivate
{
  return [(MNAudioSessionResourceAccess *)self deactivateWithForce:0];
}

- (BOOL)deactivateWithForce:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_state) {
    a3 = 1;
  }
  if (a3)
  {
    self->_unint64_t state = 1;
    char v5 = GetAudioLogForMNAudioSessionResourceAccessCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "Ⓓ Attempting to deactivate the audio session", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MNAudioSessionResourceAccess_deactivateWithForce___block_invoke;
    block[3] = &unk_1E60F6B98;
    void block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    id v7 = GetAudioLogForMNAudioSessionResourceAccessCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unint64_t state = self->_state;
      if (state >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", self->_state);
        id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v9 = off_1E60FB528[state];
      }
      *(_DWORD *)buf = 138412290;
      char v13 = v9;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "Ⓓ Deactivation ignored : unint64_t state = %@", buf, 0xCu);
    }
  }
  return a3;
}

void __52__MNAudioSessionResourceAccess_deactivateWithForce___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F4E9F0] sharedInstance];
  id v11 = 0;
  char v3 = [v2 setActive:0 error:&v11];
  id v4 = v11;

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MNAudioSessionResourceAccess_deactivateWithForce___block_invoke_2;
  v7[3] = &unk_1E60F6580;
  char v10 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __52__MNAudioSessionResourceAccess_deactivateWithForce___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48) && !*(void *)(a1 + 32))
  {
    *(void *)(*(void *)(a1 + 40) + 16) = 0;
    uint64_t v19 = GetAudioLogForMNAudioSessionResourceAccessCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_INFO, "Ⓓ    Audio session deactivation started", buf, 2u);
    }

    id v20 = [*(id *)(a1 + 40) delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      uint64_t v18 = [*(id *)(a1 + 40) delegate];
      [v18 audioSessionResourceAccess:*(void *)(a1 + 40) didDeactivateSession:1];
LABEL_19:
    }
  }
  else
  {
    *(void *)(*(void *)(a1 + 40) + 16) = 2;
    uint64_t v2 = *(void *)(a1 + 32);
    char v3 = GetAudioLogForMNAudioSessionResourceAccessCategory();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v2)
    {
      if (v4)
      {
        uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "_stringForAVAudioSessionErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
        unsigned int v6 = [*(id *)(a1 + 32) code] >> 24;
        int v7 = ([*(id *)(a1 + 32) code] >> 16);
        int v8 = ((unsigned __int16)[*(id *)(a1 + 32) code] >> 8);
        unsigned __int8 v9 = [*(id *)(a1 + 32) code];
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138413570;
        uint64_t v26 = v5;
        __int16 v27 = 1024;
        unsigned int v28 = v6;
        __int16 v29 = 1024;
        int v30 = v7;
        __int16 v31 = 1024;
        int v32 = v8;
        __int16 v33 = 1024;
        int v34 = v9;
        __int16 v35 = 2112;
        uint64_t v36 = v10;
        _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "⒟    Error deactivating audio session (error code %@ '%c%c%c%c') : %@", buf, 0x2Eu);
      }
      uint64_t v11 = 3406;
    }
    else
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "⒟    Error deactivating audio session (no error given)", buf, 2u);
      }
      uint64_t v11 = 3405;
    }

    char v12 = [*(id *)(a1 + 40) delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = NAVAudioErrorDomain();
      uint64_t v16 = *(void *)(a1 + 32);
      if (v16)
      {
        uint64_t v23 = *MEMORY[0x1E4F28A50];
        uint64_t v24 = v16;
        char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        uint64_t v18 = [v14 errorWithDomain:v15 code:v11 userInfo:v17];
      }
      else
      {
        uint64_t v18 = [v14 errorWithDomain:v15 code:v11 userInfo:0];
      }

      id v22 = [*(id *)(a1 + 40) delegate];
      [v22 audioSessionResourceAccess:*(void *)(a1 + 40) didFailWhileDeactivatingSession:v18];

      goto LABEL_19;
    }
  }
}

- (id)_stringForAVAudioSessionErrorCode:(int64_t)a3
{
  if (a3 <= 561145186)
  {
    if (a3 <= 560161139)
    {
      switch(a3)
      {
        case -50:
          BOOL v4 = @"AVAudioSessionErrorCodeBadParam";
          return v4;
        case 0:
          BOOL v4 = @"AVAudioSessionErrorCodeNone";
          return v4;
        case 560030580:
          BOOL v4 = @"AVAudioSessionErrorCodeIsBusy";
          return v4;
      }
    }
    else if (a3 > 561015904)
    {
      if (a3 == 561015905)
      {
        BOOL v4 = @"AVAudioSessionErrorCodeCannotStartPlaying";
        return v4;
      }
      if (a3 == 561017449)
      {
        BOOL v4 = @"AVAudioSessionErrorCodeInsufficientPriority";
        return v4;
      }
    }
    else
    {
      if (a3 == 560161140)
      {
        BOOL v4 = @"AVAudioSessionErrorCodeIncompatibleCategory";
        return v4;
      }
      if (a3 == 560557684)
      {
        BOOL v4 = @"AVAudioSessionErrorCodeCannotInterruptOthers";
        return v4;
      }
    }
LABEL_67:
    objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %ld", a3);
    BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (a3 > 1768841570)
  {
    if (a3 > 1936290408)
    {
      if (a3 == 1936290409)
      {
        BOOL v4 = @"AVAudioSessionErrorCodeSiriIsRecording";
        return v4;
      }
      if (a3 == 2003329396)
      {
        BOOL v4 = @"AVAudioSessionErrorCodeUnspecified";
        return v4;
      }
    }
    else
    {
      if (a3 == 1768841571)
      {
        BOOL v4 = @"AVAudioSessionErrorCodeSessionNotActive";
        return v4;
      }
      if (a3 == 1836282486)
      {
        BOOL v4 = @"AVAudioSessionErrorCodeMediaServicesFailed";
        return v4;
      }
    }
    goto LABEL_67;
  }
  if (a3 > 561210738)
  {
    if (a3 == 561210739)
    {
      BOOL v4 = @"AVAudioSessionErrorCodeExpiredSession";
      return v4;
    }
    if (a3 == 1701737535)
    {
      BOOL v4 = @"AVAudioSessionErrorCodeMissingEntitlement";
      return v4;
    }
    goto LABEL_67;
  }
  if (a3 != 561145187)
  {
    if (a3 == 561145203)
    {
      BOOL v4 = @"AVAudioSessionErrorCodeResourceNotAvailable";
      return v4;
    }
    goto LABEL_67;
  }
  BOOL v4 = @"AVAudioSessionErrorCodeCannotStartRecording";
  return v4;
}

+ (BOOL)headphonesAreInUse
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F4E9F0], "sharedInstance", 0);
  uint64_t v3 = [v2 currentRoute];
  BOOL v4 = [v3 outputs];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) isHeadphones])
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (BOOL)deviceSpeakerIsInUse
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F4E9F0], "sharedInstance", 0);
  uint64_t v3 = [v2 currentRoute];
  BOOL v4 = [v3 outputs];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4F4E970];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) portType];
        char v11 = [v10 isEqualToString:v8];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (MNAudioSessionAccessDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNAudioSessionAccessDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
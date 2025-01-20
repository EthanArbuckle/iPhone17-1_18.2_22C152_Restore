void sub_1A688DE08(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16;

  objc_msgSend_zipPath(a1, a2, a3, a4, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileSystemRepresentation(v5, v6, v7, v8, v9);
  sub_1A66E773C();
  sub_1A66E7748(&dword_1A66D3000, v10, v11, "TTSStreamingZipReader: Password failed. Could not open source: %s", v12, v13, v14, v15, v16);
}

void sub_1A688DE94()
{
  archive_error_string();
  sub_1A66E773C();
  sub_1A66E7748(&dword_1A66D3000, v0, v1, "TTSStreamingZipReader: archive_read unable to set supported formats: %s.", v2, v3, v4, v5, v6);
}

void sub_1A688DF0C()
{
  archive_error_string();
  sub_1A66E773C();
  sub_1A66E7748(&dword_1A66D3000, v0, v1, "TTSStreamingZipReader:Cant read: %s", v2, v3, v4, v5, v6);
}

void sub_1A688DF88(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = objc_msgSend_resourceList(a1, a2, a3, a4, a5);
  int v7 = 138412290;
  v8 = v6;
  _os_log_debug_impl(&dword_1A66D3000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "Loading resources: %@", (uint8_t *)&v7, 0xCu);
}

void sub_1A688E020(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a1, a4, a5);
  sub_1A66E771C(&dword_1A66D3000, v6, v7, "Finished processing string at recursion depth %@", v8, v9, v10, v11, 2u);
}

void sub_1A688E0B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A66D3000, log, OS_LOG_TYPE_DEBUG, "VoiceProvider: Reloading all components due to nil bundle hash", v1, 2u);
}

void sub_1A688E0F8(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A66D3000, a2, OS_LOG_TYPE_DEBUG, "VoiceProvider: Recovered cache entry for SSE %@", (uint8_t *)&v3, 0xCu);
}

void sub_1A688E174(uint64_t *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *a1;
  uint64_t v7 = objc_msgSend_numberWithInteger_(NSNumber, a2, 3, a4, a5);
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_1A66D3000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "VoiceProvider: voice load failed for component %@ after %@ attempts.", (uint8_t *)&v8, 0x16u);
}

void sub_1A688E230()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "VoiceProvider voice load timed out for record %@.", v2, v3, v4, v5, v6);
}

void sub_1A688E298(void *a1, const char *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend_count(a1, a2, (uint64_t)a3, a4, a5);
  uint64_t v12 = objc_msgSend_numberWithUnsignedInteger_(v7, v9, v8, v10, v11);
  sub_1A66E773C();
  __int16 v14 = 2112;
  v15 = a2;
  _os_log_debug_impl(&dword_1A66D3000, a3, OS_LOG_TYPE_DEBUG, "VoiceProvider loaded %@ voices for bundle identifier: %@", v13, 0x16u);
}

void sub_1A688E358(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void **)(a1 + 40);
  if (v7)
  {
    objc_msgSend_componentDescription(v7, (const char *)a2, (uint64_t)a3, a4, a5);
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 16) = 0;
  }
  uint64_t v8 = AXNSStringFromAudioUnitComponentDescription((unsigned int *)a2, (const char *)a2, (uint64_t)a3, a4, a5);
  sub_1A66E773C();
  _os_log_debug_impl(&dword_1A66D3000, a3, OS_LOG_TYPE_DEBUG, "VoiceProvider: Skipping voice load for %@ before first unlock", v9, 0xCu);
}

void sub_1A688E410(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A66EB73C(&dword_1A66D3000, a2, a3, "VoiceProvider voices returned nil for record %@", a5, a6, a7, a8, 2u);
}

void sub_1A688E480()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "VoiceProvider audio component initialization error %@", v2, v3, v4, v5, v6);
}

void sub_1A688E4E8()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A66E773C();
  _os_log_fault_impl(&dword_1A66D3000, v0, OS_LOG_TYPE_FAULT, "Attempting to write over 500KB of data to the component cache. %@", v1, 0xCu);
}

void sub_1A688E55C()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "VoiceProvider: failed to set component cache preference %@.", v2, v3, v4, v5, v6);
}

void sub_1A688E5C4()
{
}

void sub_1A688E5F0()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "VoiceProvider: failed to decode component cache preference with exception: %@", v2, v3, v4, v5, v6);
}

void sub_1A688E658(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A66D3000, log, OS_LOG_TYPE_ERROR, "VoiceProvider: failed to read component cache preference.", v1, 2u);
}

void sub_1A688E69C()
{
  sub_1A66E7784();
  sub_1A6713B6C(&dword_1A66D3000, v0, v1, "Tried to merge in installed assets before initial in-memory cache build.", v2, v3, v4, v5, v6);
}

void sub_1A688E6D0()
{
  sub_1A66E7784();
  sub_1A6713B6C(&dword_1A66D3000, v0, v1, "Failed to load maui/macintalk on-disk resources. Could not find maui framework!", v2, v3, v4, v5, v6);
}

void sub_1A688E704()
{
  sub_1A66E7784();
  _os_log_debug_impl(&dword_1A66D3000, v0, OS_LOG_TYPE_DEBUG, "Requested axassetsd to rebuild the preferences cache", v1, 2u);
}

void sub_1A688E744()
{
  sub_1A66E7784();
  sub_1A6713B6C(&dword_1A66D3000, v0, v1, "No download resource in _stopDownloadSiriVoiceAssetWithResource:", v2, v3, v4, v5, v6);
}

void sub_1A688E778()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "No asset for resource: %@", v2, v3, v4, v5, v6);
}

void sub_1A688E7E0()
{
  sub_1A6713BA4();
  sub_1A6713B88(&dword_1A66D3000, v0, v1, "Stopped downloading %@", v2, v3, v4, v5, v6);
}

void sub_1A688E84C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A688E8BC()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "Resource already installed: %@", v2, v3, v4, v5, v6);
}

void sub_1A688E924()
{
  sub_1A6713BA4();
  sub_1A6713B88(&dword_1A66D3000, v0, v1, "Started downloading %@", v2, v3, v4, v5, v6);
}

void sub_1A688E990()
{
  sub_1A66E7784();
  sub_1A6713B6C(&dword_1A66D3000, v0, v1, "No resource in _downloadSiriVoiceAssetWithResource:", v2, v3, v4, v5, v6);
}

void sub_1A688E9C4()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "Cannot download Siri asset. No asset instance found for resource: %@", v2, v3, v4, v5, v6);
}

void sub_1A688EA2C()
{
  sub_1A66E7784();
  sub_1A6713B6C(&dword_1A66D3000, v0, v1, "Speech sample DL: Could not find sample asset to download.", v2, v3, v4, v5, v6);
}

void sub_1A688EA60()
{
  sub_1A66E7784();
  sub_1A6713B6C(&dword_1A66D3000, v0, v1, "Error, attempted to delete asset that is not installed.", v2, v3, v4, v5, v6);
}

void sub_1A688EA94()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "Error reading in local voices for language %@.", v2, v3, v4, v5, v6);
}

void sub_1A688EAFC()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "Error creating language-code regex: %@", v2, v3, v4, v5, v6);
}

void sub_1A688EB64()
{
  sub_1A66E7784();
  sub_1A6713B6C(&dword_1A66D3000, v0, v1, "Error reading languages in for local resources.", v2, v3, v4, v5, v6);
}

void sub_1A688EB98()
{
  sub_1A66E7784();
  sub_1A6713B6C(&dword_1A66D3000, v0, v1, "Attempted to play a sample, but not sample assets were found", v2, v3, v4, v5, v6);
}

void sub_1A688EBCC()
{
  sub_1A6713BA4();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "Siri sample URL was nil for %@", v2, v3, v4, v5, v6);
}

void sub_1A688EC38()
{
  sub_1A66E7784();
  sub_1A6713B6C(&dword_1A66D3000, v0, v1, "Error: A process other than axassetsd attempted to write to the preferences cache.", v2, v3, v4, v5, v6);
}

void sub_1A688EC6C()
{
  sub_1A6713BA4();
  sub_1A6713B88(&dword_1A66D3000, v0, v1, "Did migrate uninformed siri voices: %s", v2, v3, v4, v5, v6);
}

void sub_1A688ECEC()
{
  sub_1A66E773C();
  sub_1A6713B88(&dword_1A66D3000, v0, v1, "Read resource cache version from preferences: %@", v2, v3, v4, v5, v6);
}

void sub_1A688ED54()
{
  sub_1A66E773C();
  sub_1A6713B88(&dword_1A66D3000, v0, v1, "Read catalog build number from preferences: %@", v2, v3, v4, v5, v6);
}

void sub_1A688EDBC()
{
  sub_1A66E7784();
  sub_1A6713B6C(&dword_1A66D3000, v0, v1, "Error: A process other than axassetsd attempted to write the build version to user preferences.", v2, v3, v4, v5, v6);
}

void sub_1A688EDF0()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "Error unarchiving resources: %@", v2, v3, v4, v5, v6);
}

void sub_1A688EE58()
{
  sub_1A66E773C();
  sub_1A6713B88(&dword_1A66D3000, v0, v1, "Read resources cache from preferences: %@", v2, v3, v4, v5, v6);
}

void sub_1A688EEC0(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A66D3000, log, OS_LOG_TYPE_ERROR, "Error unarchiving resources: unexpected type %@", buf, 0xCu);
}

void sub_1A688EF08()
{
  sub_1A66E7784();
  _os_log_fault_impl(&dword_1A66D3000, v0, OS_LOG_TYPE_FAULT, "Failed to decode resource in cache array.", v1, 2u);
}

void sub_1A688EF48()
{
  sub_1A66E7784();
  _os_log_fault_impl(&dword_1A66D3000, v0, OS_LOG_TYPE_FAULT, "Failed to decode resource cache array.", v1, 2u);
}

void sub_1A688EF88()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A66E773C();
  _os_log_fault_impl(&dword_1A66D3000, v0, OS_LOG_TYPE_FAULT, "Attempting to write over 500KB of data to the resource cache. %@", v1, 0xCu);
}

void sub_1A688EFFC()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "Error writing resources to preferences: %@", v2, v3, v4, v5, v6);
}

void sub_1A688F064()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "No download resource %@", v2, v3, v4, v5, v6);
}

void sub_1A688F0CC()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  sub_1A66E773C();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A66D3000, v1, OS_LOG_TYPE_ERROR, "Download failed: %@, %@", v2, 0x16u);
}

void sub_1A688F150(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A66D3000, log, OS_LOG_TYPE_ERROR, "Error: TTSAsset was nil while refreshing siri resources", buf, 2u);
}

void sub_1A688F190(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = objc_msgSend_voiceId(*(void **)(a1 + 32), a2, a3, a4, a5);
  sub_1A66E773C();
  _os_log_error_impl(&dword_1A66D3000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Cannot download voice for testing. No assset found for ID: %@", v7, 0xCu);
}

uint64_t sub_1A688F228(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 24))();
}

uint64_t sub_1A688F24C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
}

void sub_1A688F284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A688F2C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A6713B6C(&dword_1A66D3000, MEMORY[0x1E4F14500], a3, "AudioUnitGetProperty: *ioDataSize == 0 on entry", a5, a6, a7, a8, 0);
}

void sub_1A688F2FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A6713B6C(&dword_1A66D3000, MEMORY[0x1E4F14500], a3, "AudioUnitSetProperty: inData == NULL", a5, a6, a7, a8, 0);
}

void sub_1A688F338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A6713B6C(&dword_1A66D3000, MEMORY[0x1E4F14500], a3, "AudioUnitSetProperty: inDataSize == 0", a5, a6, a7, a8, 0);
}

void sub_1A688F374(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A688F3AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A688F3E4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A66D3000, a2, OS_LOG_TYPE_DEBUG, "Multiple speech dones were sent for request:%@", (uint8_t *)&v2, 0xCu);
}

void sub_1A688F45C()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  sub_1A66E773C();
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_1A66D3000, v2, OS_LOG_TYPE_ERROR, "Service identifier for voice: %@ was nil. Resource: %@. Speech Servers: %@", v3, 0x20u);
}

void sub_1A688F4F0()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "Could not find voice for identifier: %@", v2, v3, v4, v5, v6);
}

void sub_1A688F558(NSObject *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = objc_msgSend_numberWithDouble_(NSNumber, a2, a3, a4, a5);
  sub_1A66E773C();
  _os_log_debug_impl(&dword_1A66D3000, a1, OS_LOG_TYPE_DEBUG, "TextToSpeech first buffer latency: %@s", v7, 0xCu);
}

void sub_1A688F5F4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1A66D3000, log, OS_LOG_TYPE_FAULT, "Channel should not be nil. Are we deallocating the TTSAudioSessionChannel but holding a reference to it, perhaps in our unit tests?", buf, 2u);
}

void sub_1A688F634(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *AccessibilityUtilitiesLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"TTSSpeechSynthesizer.m", 39, @"%s", *a1);

  __break(1u);
}

void sub_1A688F6B4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"Class getAXSettingsClass(void)_block_invoke", v7, v8);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, (uint64_t)v9, @"TTSSpeechSynthesizer.m", 40, @"Unable to find class %s", "AXSettings");

  __break(1u);
}

void sub_1A688F730()
{
  sub_1A67208B8();
  sub_1A66E80BC(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "throwing %d", v1, v2, v3, v4, v5);
}

void sub_1A688F7A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"CFStringRef getkAXPidKey(void)", v7, v8);
  uint64_t v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"AVSpeechSynthesizer.m", 45, @"%s", v10);

  __break(1u);
}

void sub_1A688F818(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"CFStringRef getkAXNotificationDataKey(void)", v7, v8);
  uint64_t v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"AVSpeechSynthesizer.m", 44, @"%s", v10);

  __break(1u);
}

void sub_1A688F890(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"AXError get_AXPushNotificationToSystemForBroadcast(AXNotification, AXUIElementRef, __strong id)", v7, v8);
  uint64_t v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"AVSpeechSynthesizer.m", 42, @"%s", v10);

  __break(1u);
}

void sub_1A688F908(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"NSString *getAXSpeechSourceKeyVoiceOver(void)", v7, v8);
  uint64_t v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"AVSpeechSynthesizer.m", 36, @"%s", v10);

  __break(1u);
}

void sub_1A688F980(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"NSString *getAXSpeechSourceKeySwitchControl(void)", v7, v8);
  uint64_t v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"AVSpeechSynthesizer.m", 35, @"%s", v10);

  __break(1u);
}

void sub_1A688F9F8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"NSString *getAXSpeechSourceKeySpeechFeatures(void)", v7, v8);
  uint64_t v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"AVSpeechSynthesizer.m", 34, @"%s", v10);

  __break(1u);
}

void sub_1A688FA70(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"NSString *getUIAccessibilityTokenBrailleDisplayOnly(void)", v7, v8);
  uint64_t v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"AVSpeechSynthesizer.m", 43, @"%s", v10);

  __break(1u);
}

void sub_1A688FAE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A688FB24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A688FB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A688FB9C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *TextToSpeechVoiceBankingSupportLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"AVSpeechSynthesizer.m", 25, @"%s", *a1);

  __break(1u);
}

void sub_1A688FC1C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"Class getTTSVBSettingsClass(void)_block_invoke", v7, v8);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, (uint64_t)v9, @"AVSpeechSynthesizer.m", 26, @"Unable to find class %s", "TTSVBSettings");

  __break(1u);
}

void sub_1A688FC98(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"Class getAXSettingsClass(void)_block_invoke", v7, v8);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, (uint64_t)v9, @"AVSpeechSynthesizer.m", 32, @"Unable to find class %s", "AXSettings");

  __break(1u);
}

void sub_1A688FD14(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *AccessibilityUtilitiesLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"AVSpeechSynthesizer.m", 30, @"%s", *a1);

  __break(1u);
}

void sub_1A688FD94(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *AXRuntimeLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"AVSpeechSynthesizer.m", 41, @"%s", *a1);

  __break(1u);
}

void sub_1A688FE14()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  sub_1A66E773C();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A66D3000, v1, OS_LOG_TYPE_DEBUG, "Create action with SSMLRepresentation %@ ... shouldQueue: %@", v2, 0x16u);
}

void sub_1A688FEB0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A66D3000, log, OS_LOG_TYPE_ERROR, "Cannot update aux session. Synth not ready", v1, 2u);
}

void sub_1A688FEF4()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "Could not update aux category: %@", v2, v3, v4, v5, v6);
}

void sub_1A688FF5C()
{
  sub_1A66E773C();
  sub_1A66EB73C(&dword_1A66D3000, v0, v1, "Error setting participates in now playing: %@", v2, v3, v4, v5, v6);
}

void sub_1A688FFC4()
{
  __assert_rtn("-[TTSSpeechManager _updateAuxiliarySession]", "TTSSpeechManager.m", 408, "NSThread.currentThread == _runThread");
}

void sub_1A688FFF0()
{
  __assert_rtn("-[TTSSpeechManager handleAudioSessionObservers:]", "TTSSpeechManager.m", 503, "NSThread.currentThread == _runThread");
}

void sub_1A689001C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A66D3000, log, OS_LOG_TYPE_FAULT, "Audio session should have been disabled before deallocating", v1, 2u);
}

void sub_1A6890060()
{
}

void sub_1A689008C()
{
}

void sub_1A68900B8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"NSString *AXVOLocalizedStringForCharacter_Soft(UTF32Char, NSString *__strong)", v7, v8);
  uint64_t v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"TTSSpeechManager.m", 41, @"%s", v10);

  __break(1u);
}

void sub_1A6890130()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A66E773C();
  _os_log_debug_impl(&dword_1A66D3000, v0, OS_LOG_TYPE_DEBUG, "Creating AV from TTS for: %@", v1, 0xCu);
}

void sub_1A68901A4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A66E773C();
  _os_log_fault_impl(&dword_1A66D3000, v0, OS_LOG_TYPE_FAULT, "Arguments wrong format: %@", v1, 0xCu);
}

void sub_1A6890218()
{
}

void sub_1A6890244()
{
}

void sub_1A6890270()
{
}

void sub_1A689029C()
{
}

void sub_1A68902C8()
{
}

void sub_1A68902F4()
{
}

void sub_1A6890320(uint64_t a1, void *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_identifier(a2, (const char *)a2, (uint64_t)a3, a4, a5);
  int v8 = 138412546;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_1A66D3000, a3, OS_LOG_TYPE_ERROR, "Failed to speak request with error: %@. Attempting to speak again with fallback identifier: %@", (uint8_t *)&v8, 0x16u);
}

void sub_1A68903D4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"Class getAXSettingsClass(void)_block_invoke", v7, v8);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, (uint64_t)v9, @"TTSSpeechManager.m", 45, @"Unable to find class %s", "AXSettings");

  __break(1u);
}

void sub_1A6890450(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  __int16 v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *AccessibilityUtilitiesLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"TTSSpeechManager.m", 40, @"%s", *a1);

  __break(1u);
}

void sub_1A68904D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"Class getAXLanguageManagerClass(void)_block_invoke", v7, v8);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, (uint64_t)v9, @"TTSSpeechManager.m", 44, @"Unable to find class %s", "AXLanguageManager");

  __break(1u);
}

void sub_1A689054C(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A66D3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error creating regex %@", (uint8_t *)&v1, 0xCu);
}

void sub_1A68905CC(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1A66D3000, log, OS_LOG_TYPE_FAULT, "Invalid language format was used to initialize TTS voice asset", buf, 2u);
}

void sub_1A689060C()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A6738924();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, render err: %d", v1, v2, v3, v4, v5);
}

void sub_1A6890684()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A6738940();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, render err: %d", v1, v2, v3, v4, v5);
}

void sub_1A68906FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A67389AC(&dword_1A66D3000, MEMORY[0x1E4F14500], a3, "kAudioUnitErr_TooManyFramesToProcess : inFramesToProcess=%u, mMaxFramesPerSlice=%u", a5, a6, a7, a8, 0);
}

void sub_1A6890780()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A67388DC();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, render err: %d", v1, v2, v3, v4, v5);
}

void sub_1A68907F8()
{
  sub_1A6738994();
  sub_1A67389AC(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "ioData.mNumberBuffers=%u, ASBD::NumberChannelStreams(output.GetStreamFormat())=%u; kAudio_ParamError",
    v1,
    v2,
    v3,
    v4,
    v5);
}

void sub_1A6890868()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A673895C();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, render err: %d", v1, v2, v3, v4, v5);
}

void sub_1A68908E0(uint8_t *buf, unsigned char *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A66D3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown AUThreadSafeList event type", buf, 2u);
}

void sub_1A6890924()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A6738924();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, process err: %d", v1, v2, v3, v4, v5);
}

void sub_1A689099C()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A6738940();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, process err: %d", v1, v2, v3, v4, v5);
}

void sub_1A6890A14()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A67388DC();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, process err: %d", v1, v2, v3, v4, v5);
}

void sub_1A6890A8C()
{
  sub_1A6738994();
  sub_1A67389AC(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "ioData.mNumberBuffers=%u, ASBD::NumberChannelStreams(input->GetStreamFormat())=%u; kAudio_ParamError",
    v1,
    v2,
    v3,
    v4,
    v5);
}

void sub_1A6890AFC()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A673895C();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, process err: %d", v1, v2, v3, v4, v5);
}

void sub_1A6890B74()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A6738924();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, processmultiple err: %d", v1, v2, v3, v4, v5);
}

void sub_1A6890BEC()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A6738940();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, processmultiple err: %d", v1, v2, v3, v4, v5);
}

void sub_1A6890C64()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A67388DC();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, processmultiple err: %d", v1, v2, v3, v4, v5);
}

void sub_1A6890CDC()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  sub_1A6738974();
  _os_log_error_impl(&dword_1A66D3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ioOutputBufferLists[%u]->mNumberBuffers=%u, ASBD::NumberChannelStreams(output.GetStreamFormat())=%u; kAudio_ParamError",
    v0,
    0x14u);
}

void sub_1A6890D58()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  sub_1A6738974();
  _os_log_error_impl(&dword_1A66D3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "inInputBufferLists[%u]->mNumberBuffers=%u, ASBD::NumberChannelStreams(input.GetStreamFormat())=%u; kAudio_ParamError",
    v0,
    0x14u);
}

void sub_1A6890DD4()
{
  sub_1A67388F8(*MEMORY[0x1E4F143B8]);
  sub_1A673895C();
  sub_1A6738908(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "  from %s, processmultiple err: %d", v1, v2, v3, v4, v5);
}

void sub_1A6890E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A6890EC4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"NSString *getAXSpeechSourceKeyVoiceOver(void)", v7, v8);
  __int16 v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"TTSSharedUtilities.m", 42, @"%s", v10);

  __break(1u);
}

void sub_1A6890F3C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"NSString *getAXSpeechSourceKeySwitchControl(void)", v7, v8);
  __int16 v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"TTSSharedUtilities.m", 43, @"%s", v10);

  __break(1u);
}

void sub_1A6890FB4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A66D3000, log, OS_LOG_TYPE_ERROR, "Cannot use AVSpeechSynthesizerBufferCallback with Personal Voices, defaulting to output channel.", v1, 2u);
}

void sub_1A6890FF8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A66D3000, log, OS_LOG_TYPE_DEBUG, "Successfully set the thread priority\n", v1, 2u);
}

void sub_1A689103C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A66D3000, log, OS_LOG_TYPE_DEBUG, "Could NOT set the thread priority\n", v1, 2u);
}

void sub_1A6891080(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1A66D3000, a2, OS_LOG_TYPE_DEBUG, "Setting importance to %d\n", (uint8_t *)v2, 8u);
}

void sub_1A68910F8(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = dword_1E96C1740;
  _os_log_debug_impl(&dword_1A66D3000, log, OS_LOG_TYPE_DEBUG, "Normal thread priority is %d\n", (uint8_t *)v1, 8u);
}

void sub_1A689117C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  __int16 v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *AssistantServicesLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"TTSSharedUtilities.m", 34, @"%s", *a1);

  __break(1u);
}

void sub_1A68911FC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"Class getAFPreferencesClass(void)_block_invoke", v7, v8);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, (uint64_t)v9, @"TTSSharedUtilities.m", 35, @"Unable to find class %s", "AFPreferences");

  __break(1u);
}

void sub_1A6891278(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"Class getAXSettingsClass(void)_block_invoke", v7, v8);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, (uint64_t)v9, @"TTSSharedUtilities.m", 39, @"Unable to find class %s", "AXSettings");

  __break(1u);
}

void sub_1A68912F4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
  __int16 v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *AccessibilityUtilitiesLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"TTSSharedUtilities.m", 38, @"%s", *a1);

  __break(1u);
}

void sub_1A689137C()
{
  sub_1A673BAD8();
  sub_1A66E80BC(&dword_1A66D3000, MEMORY[0x1E4F14500], v0, "throwing %d", v1, v2, v3, v4, v5);
}

void sub_1A68913EC(ausdk::AUBase *a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  uint64_t LoggingString = ausdk::AUBase::GetLoggingString(a1);
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1A66D3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Warning: %s SetParameter for undefined param ID %u while initialized. Ignoring.", (uint8_t *)&v3, 0x12u);
}

void sub_1A6891488(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t LoggingString = ausdk::AUBase::GetLoggingString(*(ausdk::AUBase **)(a1 + 8));
  int v2 = 136315138;
  uint64_t v3 = LoggingString;
  _os_log_error_impl(&dword_1A66D3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Warning: %s was passed a ramped parameter event but does not implement them. Ignoring.", (uint8_t *)&v2, 0xCu);
}

void sub_1A6891510(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A66D3000, a2, OS_LOG_TYPE_ERROR, "VoiceProvider: error creating ssml delimiter regex: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A6891588(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A66D3000, a2, OS_LOG_TYPE_ERROR, "VoiceProvider: error creating ssml de-escaping regex: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_1A6891600()
{
  return MEMORY[0x1F40E2E18]();
}

uint64_t sub_1A6891610()
{
  return MEMORY[0x1F40E3030]();
}

uint64_t sub_1A6891620()
{
  return MEMORY[0x1F40E3068]();
}

uint64_t sub_1A6891630()
{
  return MEMORY[0x1F40E3078]();
}

uint64_t sub_1A6891640()
{
  return MEMORY[0x1F40E3120]();
}

uint64_t sub_1A6891650()
{
  return MEMORY[0x1F40E3148]();
}

uint64_t sub_1A6891660()
{
  return MEMORY[0x1F40E3158]();
}

uint64_t sub_1A6891670()
{
  return MEMORY[0x1F40E32A0]();
}

uint64_t sub_1A6891680()
{
  return MEMORY[0x1F40E3428]();
}

uint64_t sub_1A6891690()
{
  return MEMORY[0x1F40E37C8]();
}

uint64_t sub_1A68916A0()
{
  return MEMORY[0x1F40E37E8]();
}

uint64_t sub_1A68916B0()
{
  return MEMORY[0x1F40E3808]();
}

uint64_t sub_1A68916C0()
{
  return MEMORY[0x1F40E3810]();
}

uint64_t sub_1A68916D0()
{
  return MEMORY[0x1F40E3828]();
}

uint64_t sub_1A68916E0()
{
  return MEMORY[0x1F40E4538]();
}

uint64_t sub_1A68916F0()
{
  return MEMORY[0x1F40E4548]();
}

uint64_t sub_1A6891700()
{
  return MEMORY[0x1F40E4900]();
}

uint64_t sub_1A6891710()
{
  return MEMORY[0x1F40E4940]();
}

uint64_t sub_1A6891720()
{
  return MEMORY[0x1F40E4968]();
}

uint64_t sub_1A6891730()
{
  return MEMORY[0x1F40E4998]();
}

uint64_t sub_1A6891740()
{
  return MEMORY[0x1F40E4A78]();
}

uint64_t sub_1A6891750()
{
  return MEMORY[0x1F40E4AB0]();
}

uint64_t sub_1A6891760()
{
  return MEMORY[0x1F40E4B18]();
}

uint64_t sub_1A6891770()
{
  return MEMORY[0x1F40E4B88]();
}

uint64_t sub_1A6891780()
{
  return MEMORY[0x1F40E4BC0]();
}

uint64_t sub_1A6891790()
{
  return MEMORY[0x1F40E4DA0]();
}

uint64_t sub_1A68917A0()
{
  return MEMORY[0x1F40E52C8]();
}

uint64_t sub_1A68917B0()
{
  return MEMORY[0x1F40E52F8]();
}

uint64_t sub_1A68917C0()
{
  return MEMORY[0x1F40E5380]();
}

uint64_t sub_1A68917D0()
{
  return MEMORY[0x1F40E53A8]();
}

uint64_t sub_1A68917E0()
{
  return MEMORY[0x1F40E53F0]();
}

uint64_t sub_1A68917F0()
{
  return MEMORY[0x1F40E5440]();
}

uint64_t sub_1A6891800()
{
  return MEMORY[0x1F40E5450]();
}

uint64_t sub_1A6891810()
{
  return MEMORY[0x1F40E5460]();
}

uint64_t sub_1A6891820()
{
  return MEMORY[0x1F40E5488]();
}

uint64_t sub_1A6891830()
{
  return MEMORY[0x1F40E54D0]();
}

uint64_t sub_1A6891840()
{
  return MEMORY[0x1F40E54F0]();
}

uint64_t sub_1A6891850()
{
  return MEMORY[0x1F40E5508]();
}

uint64_t sub_1A6891860()
{
  return MEMORY[0x1F40E5518]();
}

uint64_t sub_1A6891870()
{
  return MEMORY[0x1F40E5530]();
}

uint64_t sub_1A6891880()
{
  return MEMORY[0x1F40E5538]();
}

uint64_t sub_1A6891890()
{
  return MEMORY[0x1F40E5548]();
}

uint64_t sub_1A68918A0()
{
  return MEMORY[0x1F40E5550]();
}

uint64_t sub_1A68918B0()
{
  return MEMORY[0x1F40E5558]();
}

uint64_t sub_1A68918C0()
{
  return MEMORY[0x1F40E5570]();
}

uint64_t sub_1A68918D0()
{
  return MEMORY[0x1F40E5580]();
}

uint64_t sub_1A68918E0()
{
  return MEMORY[0x1F40E5588]();
}

uint64_t sub_1A68918F0()
{
  return MEMORY[0x1F4105C60]();
}

uint64_t sub_1A6891900()
{
  return MEMORY[0x1F4105C68]();
}

uint64_t sub_1A6891910()
{
  return MEMORY[0x1F40E5630]();
}

uint64_t sub_1A6891920()
{
  return MEMORY[0x1F40E5640]();
}

uint64_t sub_1A6891930()
{
  return MEMORY[0x1F40E5690]();
}

uint64_t sub_1A6891940()
{
  return MEMORY[0x1F40E56A0]();
}

uint64_t sub_1A6891950()
{
  return MEMORY[0x1F40E56B8]();
}

uint64_t sub_1A6891960()
{
  return MEMORY[0x1F40E56D0]();
}

uint64_t sub_1A6891970()
{
  return MEMORY[0x1F40E56E0]();
}

uint64_t sub_1A6891980()
{
  return MEMORY[0x1F40E56F8]();
}

uint64_t sub_1A6891990()
{
  return MEMORY[0x1F40E5710]();
}

uint64_t sub_1A68919A0()
{
  return MEMORY[0x1F40E5760]();
}

uint64_t sub_1A68919B0()
{
  return MEMORY[0x1F40E5778]();
}

uint64_t sub_1A68919C0()
{
  return MEMORY[0x1F40E5780]();
}

uint64_t sub_1A68919D0()
{
  return MEMORY[0x1F40E5790]();
}

uint64_t sub_1A68919E0()
{
  return MEMORY[0x1F40E57C0]();
}

uint64_t sub_1A68919F0()
{
  return MEMORY[0x1F40E57F0]();
}

uint64_t sub_1A6891A00()
{
  return MEMORY[0x1F40E5828]();
}

uint64_t sub_1A6891A10()
{
  return MEMORY[0x1F40E5830]();
}

uint64_t sub_1A6891A20()
{
  return MEMORY[0x1F40E5848]();
}

uint64_t sub_1A6891A30()
{
  return MEMORY[0x1F40E5870]();
}

uint64_t sub_1A6891A40()
{
  return MEMORY[0x1F40E5888]();
}

uint64_t sub_1A6891A50()
{
  return MEMORY[0x1F4187530]();
}

uint64_t sub_1A6891A60()
{
  return MEMORY[0x1F4187548]();
}

uint64_t sub_1A6891A70()
{
  return MEMORY[0x1F4187558]();
}

uint64_t sub_1A6891A80()
{
  return MEMORY[0x1F4187560]();
}

uint64_t sub_1A6891A90()
{
  return MEMORY[0x1F4187570]();
}

uint64_t sub_1A6891AA0()
{
  return MEMORY[0x1F4187580]();
}

uint64_t sub_1A6891AB0()
{
  return MEMORY[0x1F4119148]();
}

uint64_t sub_1A6891AC0()
{
  return MEMORY[0x1F4105C80]();
}

uint64_t sub_1A6891AD0()
{
  return MEMORY[0x1F4105C90]();
}

uint64_t sub_1A6891AE0()
{
  return MEMORY[0x1F4105C98]();
}

uint64_t sub_1A6891AF0()
{
  return MEMORY[0x1F4105CA0]();
}

uint64_t sub_1A6891B00()
{
  return MEMORY[0x1F4105CA8]();
}

uint64_t sub_1A6891B10()
{
  return MEMORY[0x1F4105CC8]();
}

uint64_t sub_1A6891B20()
{
  return MEMORY[0x1F4105D00]();
}

uint64_t sub_1A6891B30()
{
  return MEMORY[0x1F4105D28]();
}

uint64_t sub_1A6891B40()
{
  return MEMORY[0x1F4105D38]();
}

uint64_t sub_1A6891B50()
{
  return MEMORY[0x1F4105D48]();
}

uint64_t sub_1A6891B60()
{
  return MEMORY[0x1F4105D50]();
}

uint64_t sub_1A6891B70()
{
  return MEMORY[0x1F4105D68]();
}

uint64_t sub_1A6891B80()
{
  return MEMORY[0x1F4105D70]();
}

uint64_t sub_1A6891B90()
{
  return MEMORY[0x1F4105D78]();
}

uint64_t sub_1A6891BA0()
{
  return MEMORY[0x1F4105D80]();
}

uint64_t sub_1A6891BB0()
{
  return MEMORY[0x1F4105D88]();
}

uint64_t sub_1A6891BC0()
{
  return MEMORY[0x1F4105D90]();
}

uint64_t sub_1A6891BD0()
{
  return MEMORY[0x1F4105DA0]();
}

uint64_t sub_1A6891BE0()
{
  return MEMORY[0x1F4105DA8]();
}

uint64_t sub_1A6891BF0()
{
  return MEMORY[0x1F4105DB0]();
}

uint64_t sub_1A6891C00()
{
  return MEMORY[0x1F4105DB8]();
}

uint64_t sub_1A6891C10()
{
  return MEMORY[0x1F4105DC0]();
}

uint64_t sub_1A6891C20()
{
  return MEMORY[0x1F4188358]();
}

uint64_t sub_1A6891C30()
{
  return MEMORY[0x1F41883B8]();
}

uint64_t sub_1A6891C40()
{
  return MEMORY[0x1F41883C8]();
}

uint64_t sub_1A6891C50()
{
  return MEMORY[0x1F4112638]();
}

uint64_t sub_1A6891C60()
{
  return MEMORY[0x1F4112640]();
}

uint64_t sub_1A6891C70()
{
  return MEMORY[0x1F4112670]();
}

uint64_t sub_1A6891C80()
{
  return MEMORY[0x1F4112678]();
}

uint64_t sub_1A6891C90()
{
  return MEMORY[0x1F4112698]();
}

uint64_t sub_1A6891CA0()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1A6891CB0()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1A6891CC0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A6891CD0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1A6891CE0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A6891CF0()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1A6891D00()
{
  return MEMORY[0x1F4186BA8]();
}

uint64_t sub_1A6891D10()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1A6891D20()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1A6891D30()
{
  return MEMORY[0x1F40D6A58]();
}

uint64_t sub_1A6891D40()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1A6891D50()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1A6891D60()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1A6891D70()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1A6891D80()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1A6891D90()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1A6891DA0()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1A6891DB0()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1A6891DC0()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1A6891DD0()
{
  return MEMORY[0x1F4186C68]();
}

uint64_t sub_1A6891DE0()
{
  return MEMORY[0x1F4186CB8]();
}

uint64_t sub_1A6891DF0()
{
  return MEMORY[0x1F4186D00]();
}

uint64_t sub_1A6891E00()
{
  return MEMORY[0x1F4186D20]();
}

uint64_t sub_1A6891E10()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t sub_1A6891E20()
{
  return MEMORY[0x1F4186E20]();
}

uint64_t sub_1A6891E30()
{
  return MEMORY[0x1F4186E30]();
}

uint64_t sub_1A6891E40()
{
  return MEMORY[0x1F4186E58]();
}

uint64_t sub_1A6891E50()
{
  return MEMORY[0x1F4186EA8]();
}

uint64_t sub_1A6891E60()
{
  return MEMORY[0x1F4186EE0]();
}

uint64_t sub_1A6891E70()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1A6891E80()
{
  return MEMORY[0x1F4183288]();
}

uint64_t sub_1A6891E90()
{
  return MEMORY[0x1F40E5FF8]();
}

uint64_t sub_1A6891EA0()
{
  return MEMORY[0x1F40E6028]();
}

uint64_t sub_1A6891EB0()
{
  return MEMORY[0x1F4183320]();
}

uint64_t sub_1A6891EC0()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1A6891ED0()
{
  return MEMORY[0x1F4183408]();
}

uint64_t sub_1A6891EE0()
{
  return MEMORY[0x1F41834A0]();
}

uint64_t sub_1A6891EF0()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1A6891F00()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1A6891F10()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1A6891F20()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1A6891F30()
{
  return MEMORY[0x1F41883F0]();
}

uint64_t sub_1A6891F40()
{
  return MEMORY[0x1F4188400]();
}

uint64_t sub_1A6891F50()
{
  return MEMORY[0x1F4188428]();
}

uint64_t sub_1A6891F60()
{
  return MEMORY[0x1F41836C0]();
}

uint64_t sub_1A6891F70()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1A6891F80()
{
  return MEMORY[0x1F4183738]();
}

uint64_t sub_1A6891F90()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1A6891FA0()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1A6891FB0()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1A6891FC0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A6891FD0()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_1A6891FE0()
{
  return MEMORY[0x1F40E61B0]();
}

uint64_t sub_1A6891FF0()
{
  return MEMORY[0x1F40E61C0]();
}

uint64_t sub_1A6892000()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_1A6892010()
{
  return MEMORY[0x1F40E61E0]();
}

uint64_t sub_1A6892020()
{
  return MEMORY[0x1F40E61F0]();
}

uint64_t sub_1A6892030()
{
  return MEMORY[0x1F40E6220]();
}

uint64_t sub_1A6892040()
{
  return MEMORY[0x1F40E6230]();
}

uint64_t sub_1A6892050()
{
  return MEMORY[0x1F40E6250]();
}

uint64_t sub_1A6892060()
{
  return MEMORY[0x1F40E6270]();
}

uint64_t sub_1A6892070()
{
  return MEMORY[0x1F40E62A8]();
}

uint64_t sub_1A6892080()
{
  return MEMORY[0x1F40E62F0]();
}

uint64_t sub_1A6892090()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1A68920A0()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1A68920B0()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A68920C0()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1A68920D0()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1A68920E0()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1A68920F0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A6892100()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1A6892110()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1A6892120()
{
  return MEMORY[0x1F4183A10]();
}

uint64_t sub_1A6892130()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1A6892140()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1A6892150()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A6892160()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1A6892170()
{
  return MEMORY[0x1F4183A68]();
}

uint64_t sub_1A6892180()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1A6892190()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A68921A0()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1A68921B0()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_1A68921C0()
{
  return MEMORY[0x1F4183AC8]();
}

uint64_t sub_1A68921D0()
{
  return MEMORY[0x1F4183B00]();
}

uint64_t sub_1A68921E0()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1A68921F0()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1A6892200()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1A6892210()
{
  return MEMORY[0x1F4183B48]();
}

uint64_t sub_1A6892220()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1A6892230()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1A6892240()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1A6892250()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1A6892260()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1A6892270()
{
  return MEMORY[0x1F4183C48]();
}

uint64_t sub_1A6892280()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1A6892290()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1A68922A0()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1A68922B0()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1A68922C0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1A68922D0()
{
  return MEMORY[0x1F40E6340]();
}

uint64_t sub_1A68922E0()
{
  return MEMORY[0x1F40E6368]();
}

uint64_t sub_1A68922F0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1A6892300()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A6892310()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1A6892320()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1A6892330()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1A6892340()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1A6892350()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1A6892360()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1A6892370()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1A6892380()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1A6892390()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1A68923A0()
{
  return MEMORY[0x1F4183F80]();
}

uint64_t sub_1A68923B0()
{
  return MEMORY[0x1F4183F98]();
}

uint64_t sub_1A68923C0()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A68923D0()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1A68923E0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1A68923F0()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1A6892400()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t sub_1A6892450()
{
  return MEMORY[0x1F4187C90]();
}

uint64_t sub_1A6892460()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1A6892470()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1A6892480()
{
  return MEMORY[0x1F4187CE0]();
}

uint64_t sub_1A6892490()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1A68924A0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1A68924B0()
{
  return MEMORY[0x1F4187D08]();
}

uint64_t sub_1A68924C0()
{
  return MEMORY[0x1F4187D10]();
}

uint64_t sub_1A68924D0()
{
  return MEMORY[0x1F4187D18]();
}

uint64_t sub_1A68924E0()
{
  return MEMORY[0x1F4187D20]();
}

uint64_t sub_1A68924F0()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1A6892500()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_1A6892510()
{
  return MEMORY[0x1F4187D48]();
}

uint64_t sub_1A6892520()
{
  return MEMORY[0x1F4105DF8]();
}

uint64_t sub_1A6892530()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1A6892550()
{
  return MEMORY[0x1F4187D68]();
}

uint64_t sub_1A6892560()
{
  return MEMORY[0x1F4187D70]();
}

uint64_t sub_1A6892570()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1A6892580()
{
  return MEMORY[0x1F4187D80]();
}

uint64_t sub_1A6892590()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1A68925B0()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1A68925C0()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t sub_1A68925D0()
{
  return MEMORY[0x1F4187E00]();
}

uint64_t sub_1A68925E0()
{
  return MEMORY[0x1F4187E10]();
}

uint64_t sub_1A6892600()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1A6892620()
{
  return MEMORY[0x1F4187E98]();
}

uint64_t sub_1A6892630()
{
  return MEMORY[0x1F4187EA0]();
}

uint64_t sub_1A6892640()
{
  return MEMORY[0x1F4187EB0]();
}

uint64_t sub_1A6892650()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1A6892660()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1A6892670()
{
  return MEMORY[0x1F4187EC8]();
}

uint64_t sub_1A6892680()
{
  return MEMORY[0x1F4187ED0]();
}

uint64_t sub_1A68926A0()
{
  return MEMORY[0x1F4187EF8]();
}

uint64_t sub_1A68926B0()
{
  return MEMORY[0x1F4187F00]();
}

uint64_t sub_1A68926C0()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1A68926D0()
{
  return MEMORY[0x1F41840C0]();
}

uint64_t sub_1A68926E0()
{
  return MEMORY[0x1F40E6438]();
}

uint64_t sub_1A68926F0()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1A6892700()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1A6892710()
{
  return MEMORY[0x1F41841A8]();
}

uint64_t sub_1A6892720()
{
  return MEMORY[0x1F41841B0]();
}

uint64_t sub_1A6892730()
{
  return MEMORY[0x1F41841B8]();
}

uint64_t sub_1A6892740()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1A6892750()
{
  return MEMORY[0x1F4184228]();
}

uint64_t sub_1A6892760()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1A6892770()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1A6892780()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1A6892790()
{
  return MEMORY[0x1F4184318]();
}

uint64_t sub_1A68927A0()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1A68927B0()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1A68927C0()
{
  return MEMORY[0x1F4184340]();
}

uint64_t sub_1A68927D0()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1A68927E0()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1A68927F0()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1A6892800()
{
  return MEMORY[0x1F4184578]();
}

uint64_t sub_1A6892810()
{
  return MEMORY[0x1F40E64E0]();
}

uint64_t sub_1A6892820()
{
  return MEMORY[0x1F4187420]();
}

uint64_t sub_1A6892840()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1A6892850()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A6892860()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1A6892870()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1A6892880()
{
  return MEMORY[0x1F4186FC8]();
}

uint64_t sub_1A6892890()
{
  return MEMORY[0x1F4186FE0]();
}

uint64_t sub_1A68928A0()
{
  return MEMORY[0x1F41870A8]();
}

uint64_t sub_1A68928B0()
{
  return MEMORY[0x1F41870B0]();
}

uint64_t sub_1A68928C0()
{
  return MEMORY[0x1F41870E8]();
}

uint64_t sub_1A68928D0()
{
  return MEMORY[0x1F41870F8]();
}

uint64_t sub_1A68928E0()
{
  return MEMORY[0x1F4187128]();
}

uint64_t sub_1A68928F0()
{
  return MEMORY[0x1F4187138]();
}

uint64_t sub_1A6892900()
{
  return MEMORY[0x1F4187160]();
}

uint64_t sub_1A6892910()
{
  return MEMORY[0x1F41871E8]();
}

uint64_t sub_1A6892920()
{
  return MEMORY[0x1F4187220]();
}

uint64_t sub_1A6892930()
{
  return MEMORY[0x1F4187228]();
}

uint64_t sub_1A6892940()
{
  return MEMORY[0x1F4187438]();
}

uint64_t sub_1A6892950()
{
  return MEMORY[0x1F4187298]();
}

uint64_t sub_1A6892960()
{
  return MEMORY[0x1F41872B0]();
}

uint64_t sub_1A6892970()
{
  return MEMORY[0x1F41872C8]();
}

uint64_t sub_1A6892980()
{
  return MEMORY[0x1F41872E8]();
}

uint64_t sub_1A6892990()
{
  return MEMORY[0x1F40E6900]();
}

uint64_t sub_1A68929A0()
{
  return MEMORY[0x1F41874B0]();
}

uint64_t sub_1A68929B0()
{
  return MEMORY[0x1F41874B8]();
}

uint64_t sub_1A68929C0()
{
  return MEMORY[0x1F41874C8]();
}

uint64_t sub_1A68929D0()
{
  return MEMORY[0x1F40E6980]();
}

uint64_t sub_1A68929E0()
{
  return MEMORY[0x1F4105E10]();
}

uint64_t sub_1A68929F0()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1A6892A00()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A6892A10()
{
  return MEMORY[0x1F4184770]();
}

uint64_t sub_1A6892A20()
{
  return MEMORY[0x1F4184790]();
}

uint64_t sub_1A6892A30()
{
  return MEMORY[0x1F4184798]();
}

uint64_t sub_1A6892A40()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1A6892A50()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A6892A60()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A6892A70()
{
  return MEMORY[0x1F40E6BE8]();
}

uint64_t sub_1A6892A80()
{
  return MEMORY[0x1F40E6C20]();
}

uint64_t sub_1A6892A90()
{
  return MEMORY[0x1F40E6C60]();
}

uint64_t sub_1A6892AA0()
{
  return MEMORY[0x1F40E6C88]();
}

uint64_t sub_1A6892AB0()
{
  return MEMORY[0x1F40E6CC0]();
}

uint64_t sub_1A6892AC0()
{
  return MEMORY[0x1F40E6D78]();
}

uint64_t sub_1A6892AD0()
{
  return MEMORY[0x1F40E6D80]();
}

uint64_t sub_1A6892AE0()
{
  return MEMORY[0x1F4184858]();
}

uint64_t sub_1A6892AF0()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1A6892B00()
{
  return MEMORY[0x1F4184A60]();
}

uint64_t sub_1A6892B10()
{
  return MEMORY[0x1F4184A78]();
}

uint64_t sub_1A6892B20()
{
  return MEMORY[0x1F4184A80]();
}

uint64_t sub_1A6892B30()
{
  return MEMORY[0x1F4184A88]();
}

uint64_t sub_1A6892B40()
{
  return MEMORY[0x1F4184AB0]();
}

uint64_t sub_1A6892B50()
{
  return MEMORY[0x1F4184AC0]();
}

uint64_t sub_1A6892B60()
{
  return MEMORY[0x1F4184AC8]();
}

uint64_t sub_1A6892B80()
{
  return MEMORY[0x1F4184B10]();
}

uint64_t sub_1A6892B90()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A6892BA0()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1A6892BB0()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1A6892BC0()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1A6892BD0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1A6892BE0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1A6892BF0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1A6892C00()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1A6892C10()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1A6892C20()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1A6892C30()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1A6892C40()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A6892C50()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A6892C60()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1A6892C70()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A6892C80()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1A6892C90()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1A6892CA0()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1A6892CB0()
{
  return MEMORY[0x1F4184E28]();
}

uint64_t sub_1A6892CC0()
{
  return MEMORY[0x1F4184E40]();
}

uint64_t sub_1A6892CD0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A6892CE0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1A6892CF0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1A6892D00()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1A6892D10()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1A6892D20()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1A6892D30()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1A6892D40()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1A6892D50()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1A6892D60()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1A6892D70()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1A6892D80()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1A6892D90()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1A6892DA0()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1A6892DB0()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t sub_1A6892DC0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1A6892DD0()
{
  return MEMORY[0x1F4185080]();
}

uint64_t sub_1A6892DE0()
{
  return MEMORY[0x1F4185088]();
}

uint64_t sub_1A6892DF0()
{
  return MEMORY[0x1F4185090]();
}

uint64_t sub_1A6892E00()
{
  return MEMORY[0x1F4185098]();
}

uint64_t sub_1A6892E10()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1A6892E20()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1A6892E30()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1A6892E40()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1A6892E50()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A6892E60()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1A6892E70()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1A6892E80()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1A6892E90()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_1A6892EA0()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1A6892EB0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A6892EC0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1A6892ED0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1A6892EE0()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1A6892EF0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A6892F00()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A6892F10()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1A6892F30()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A6892F40()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1A6892F50()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1A6892F60()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1A6892F70()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1A6892F80()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1A6892F90()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1A6892FA0()
{
  return MEMORY[0x1F4185580]();
}

uint64_t sub_1A6892FB0()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1A6892FC0()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1A6892FD0()
{
  return MEMORY[0x1F41855B0]();
}

uint64_t sub_1A6892FE0()
{
  return MEMORY[0x1F41855D0]();
}

uint64_t sub_1A6892FF0()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1A6893000()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1A6893010()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1A6893020()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1A6893030()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1A6893040()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1A6893050()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1A6893060()
{
  return MEMORY[0x1F41856A8]();
}

uint64_t sub_1A6893070()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1A6893080()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1A6893090()
{
  return MEMORY[0x1F41856D8]();
}

uint64_t sub_1A68930A0()
{
  return MEMORY[0x1F41856F8]();
}

uint64_t sub_1A68930B0()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1A68930C0()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1A68930D0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1A68930E0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A6893100()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1A6893110()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1A6893120()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A6893140()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1A6893150()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A6893160()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1A6893180()
{
  return MEMORY[0x1F40E6E28]();
}

uint64_t sub_1A6893190()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A68931A0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1A68931B0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1A68931C0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A68931D0()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1A68931E0()
{
  return MEMORY[0x1F4185E98]();
}

uint64_t sub_1A68931F0()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1A6893200()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A6893210()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A6893220()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1A6893230()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1A6893240()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1A6893250()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A6893260()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1A6893270()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1A6893280()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1A6893290()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1A68932A0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1A68932B0()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1A68932E0()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t ATAudioProcessingNodeDispose()
{
  return MEMORY[0x1F40D4B00]();
}

uint64_t ATAudioProcessingNodeInstantiate()
{
  return MEMORY[0x1F40D4B08]();
}

uint64_t ATAudioProcessingNodeSetParameter()
{
  return MEMORY[0x1F40D4B18]();
}

uint64_t ATAudioProcessingNodeSetProperty()
{
  return MEMORY[0x1F40D4B20]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x1F4105E38]();
}

uint64_t AXCLanguageCanonicalFormToGeneralLanguage()
{
  return MEMORY[0x1F4105E40]();
}

uint64_t AXCLanguageConvertToCanonicalForm()
{
  return MEMORY[0x1F4105E50]();
}

uint64_t AXCRemapLanguageCodeToFallbackIfNeccessary()
{
  return MEMORY[0x1F4105E58]();
}

uint64_t AXCUProcessIsAXUIServer()
{
  return MEMORY[0x1F4105E60]();
}

uint64_t AXCUProcessIsPreferences()
{
  return MEMORY[0x1F4105E78]();
}

uint64_t AXDeviceIsJ42()
{
  return MEMORY[0x1F4105ED8]();
}

uint64_t AXDeviceSupportsVoiceBankingSpeech()
{
  return MEMORY[0x1F4105F30]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1F4105FE0]();
}

uint64_t AXLogSpeechAssetDownload()
{
  return MEMORY[0x1F4106090]();
}

uint64_t AXLogSpeechSynthesis()
{
  return MEMORY[0x1F4106098]();
}

uint64_t AXNSLocalizedStringForLocale()
{
  return MEMORY[0x1F41787F0]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x1F4106190]();
}

uint64_t AXProcessIsAXAssetsd()
{
  return MEMORY[0x1F41061C0]();
}

uint64_t AXProcessIsAxctl()
{
  return MEMORY[0x1F41061D8]();
}

uint64_t AXProcessIsLiveSpeech()
{
  return MEMORY[0x1F41061F8]();
}

uint64_t AXProcessMacOSSettingsExtension()
{
  return MEMORY[0x1F4106238]();
}

uint64_t AXSAccessibilityUtilitiesPath()
{
  return MEMORY[0x1F4178800]();
}

uint64_t AXSetThreadPriority()
{
  return MEMORY[0x1F41062C8]();
}

uint64_t AXSystemRootDirectory()
{
  return MEMORY[0x1F41062D8]();
}

uint64_t AXTTSLogCommon()
{
  return MEMORY[0x1F41062E0]();
}

uint64_t AXTTSLogRange()
{
  return MEMORY[0x1F41062F0]();
}

uint64_t AXTTSLogResourceManager()
{
  return MEMORY[0x1F41062F8]();
}

uint64_t AXTTSLogResourceMigration()
{
  return MEMORY[0x1F4106300]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x1F4106310]();
}

OSStatus AudioComponentGetDescription(AudioComponent inComponent, AudioComponentDescription *outDesc)
{
  return MEMORY[0x1F410B480](inComponent, outDesc);
}

AudioComponent AudioComponentInstanceGetComponent(AudioComponentInstance inInstance)
{
  return (AudioComponent)MEMORY[0x1F410B4A0](inInstance);
}

AudioComponent AudioComponentRegister(const AudioComponentDescription *inDesc, CFStringRef inName, UInt32 inVersion, AudioComponentFactoryFunction inFactory)
{
  return (AudioComponent)MEMORY[0x1F410B4B8](inDesc, inName, *(void *)&inVersion, inFactory);
}

OSStatus AudioQueueAddPropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x1F40D4CD8](inAQ, *(void *)&inID, inProc, inUserData);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x1F40D4CE0](inAQ, *(void *)&inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x1F40D4D18](inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return MEMORY[0x1F40D4D20](inAQ, inBuffer, *(void *)&inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueEnqueueBufferWithParameters(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs, UInt32 inTrimFramesAtStart, UInt32 inTrimFramesAtEnd, UInt32 inNumParamValues, const AudioQueueParameterEvent *inParamValues, const AudioTimeStamp *inStartTime, AudioTimeStamp *outActualStartTime)
{
  return MEMORY[0x1F40D4D28](inAQ, inBuffer, *(void *)&inNumPacketDescs, inPacketDescs, *(void *)&inTrimFramesAtStart, *(void *)&inTrimFramesAtEnd, *(void *)&inNumParamValues, inParamValues);
}

OSStatus AudioQueueFlush(AudioQueueRef inAQ)
{
  return MEMORY[0x1F40D4D38](inAQ);
}

OSStatus AudioQueueFreeBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer)
{
  return MEMORY[0x1F40D4D40](inAQ, inBuffer);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x1F40D4D58](inAQ, *(void *)&inID, outData, ioDataSize);
}

uint64_t AudioQueueNewOutputWithAudioSession()
{
  return MEMORY[0x1F40D4D88]();
}

OSStatus AudioQueuePause(AudioQueueRef inAQ)
{
  return MEMORY[0x1F40D4D90](inAQ);
}

OSStatus AudioQueueRemovePropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x1F40D4DC8](inAQ, *(void *)&inID, inProc, inUserData);
}

OSStatus AudioQueueReset(AudioQueueRef inAQ)
{
  return MEMORY[0x1F40D4DD0](inAQ);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x1F40D4DE8](inAQ, *(void *)&inID, inData, *(void *)&inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return MEMORY[0x1F40D4DF0](inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x1F40D4E00](inAQ, inImmediate);
}

OSStatus AudioUnitGetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x1F410B638](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outData, ioDataSize);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x1F410B670](inUnit, ioActionFlags, inTimeStamp, *(void *)&inOutputBusNumber, *(void *)&inNumberFrames, ioData);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x1F410B688](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, *(void *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x1F410B690](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, inData, *(void *)&inDataSize);
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x1F4113BB0]();
}

uint64_t CEMEmojiTokenCopyName()
{
  return MEMORY[0x1F4113BF0]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x1F4113C70]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithLocaleAndBlock()
{
  return MEMORY[0x1F4113C78]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1F40D7AA0](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D8688](string, range.location, range.length);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDD8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE08]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE20]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1F415CBC0]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x1F415CBE0]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1F415CC10]();
}

uint64_t VOTLogSpeech()
{
  return MEMORY[0x1F4106360]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x1F4178910]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x1F4178CC8]();
}

uint64_t _AXSSpeechSynthesisOptions()
{
  return MEMORY[0x1F4179050]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x1F4179118]();
}

uint64_t _AXSVoiceOverTouchSpeakingRate()
{
  return MEMORY[0x1F41791D0]();
}

uint64_t _AXSVoiceOverTouchVolume()
{
  return MEMORY[0x1F41791F8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4D8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x1F417E9D0](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

float __exp10f(float a1)
{
  MEMORY[0x1F40C9B98](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1F40C9C30]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

{
  return MEMORY[0x1F41813D8]();
}

{
  return MEMORY[0x1F41813E8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x1F41863A0]();
}

void abort(void)
{
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1F417E000]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1F417E080]();
}

uint64_t archive_read_add_passphrase()
{
  return MEMORY[0x1F417E088]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1F417E0A8]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1F417E110]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1F417E118]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1F417E120]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x1F417E140]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x1F417E1A0]();
}

void bzero(void *a1, size_t a2)
{
}

float cbrtf(float a1)
{
  MEMORY[0x1F40CA690](a1);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x1F4181798])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1F40CD5F0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1F40CDB68](a1, *(void *)&a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_deserialize(sqlite3 *db, const char *zSchema, unsigned __int8 *pData, sqlite3_int64 szDb, sqlite3_int64 szBuf, unsigned int mFlags)
{
  return MEMORY[0x1F4182188](db, zSchema, pData, szDb, szBuf, *(void *)&mFlags);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1F4182278](filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1F4188208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1F4186630]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

int32_t uregex_end(URegularExpression *regexp, int32_t groupNum, UErrorCode *status)
{
  return MEMORY[0x1F4180468](regexp, *(void *)&groupNum, status);
}

UBool uregex_find(URegularExpression *regexp, int32_t startIndex, UErrorCode *status)
{
  return MEMORY[0x1F4180478](regexp, *(void *)&startIndex, status);
}

URegularExpression *__cdecl uregex_open(const UChar *pattern, int32_t patternLength, uint32_t flags, UParseError *pe, UErrorCode *status)
{
  return (URegularExpression *)MEMORY[0x1F41804B8](pattern, *(void *)&patternLength, *(void *)&flags, pe, status);
}

void uregex_setText(URegularExpression *regexp, const UChar *text, int32_t textLength, UErrorCode *status)
{
}

int32_t uregex_start(URegularExpression *regexp, int32_t groupNum, UErrorCode *status)
{
  return MEMORY[0x1F4180510](regexp, *(void *)&groupNum, status);
}

void uregex_useAnchoringBounds(URegularExpression *regexp, UBool b, UErrorCode *status)
{
}

uint64_t uscript_getScriptExtensions()
{
  return MEMORY[0x1F41805E8]();
}

uint64_t uscript_getShortName()
{
  return MEMORY[0x1F41805F0]();
}

void vDSP_DFT_DestroySetup(vDSP_DFT_Setup __Setup)
{
}

void vDSP_DFT_Execute(const vDSP_DFT_SetupStruct *__Setup, const float *__Ir, const float *__Ii, float *__Or, float *__Oi)
{
}

vDSP_DFT_Setup vDSP_DFT_zop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x1F40D1978](__Previous, __Length, *(void *)&__Direction);
}

vDSP_DFT_Setup vDSP_DFT_zrop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x1F40D1980](__Previous, __Length, *(void *)&__Direction);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_nzcros(const float *__A, vDSP_Stride __IA, vDSP_Length __B, vDSP_Length *__C, vDSP_Length *__D, vDSP_Length __N)
{
}

void vDSP_svdiv(const float *__A, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vdiv(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vneg(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vramp(const float *__A, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmsa(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, const float *__D, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vthr(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N, int __Conjugate)
{
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1F40CE708]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1F40CE710]();
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

void vvlogf(float *a1, const float *a2, const int *a3)
{
}

void vvpowf(float *a1, const float *a2, const float *a3, const int *a4)
{
}

void vvsqrtf(float *a1, const float *a2, const int *a3)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1F40CED30]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40CED38]();
}
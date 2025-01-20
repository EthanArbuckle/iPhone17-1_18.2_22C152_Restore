uint64_t AceObjectIntegerForProperty(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  v2 = [a1 propertyForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = [v2 integerValue];
  }
  else {
    v3 = 0;
  }

  return v3;
}

id AceObjectWithClass(objc_class *a1)
{
  id v1 = objc_alloc_init(a1);
  return v1;
}

id AceObjectWithClassAndDictionary(objc_class *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = (void *)[[a1 alloc] initWithDictionary:v4];

  return v5;
}

void AceObjectSetDoubleForProperty(void *a1, void *a2, double a3)
{
  v5 = (objc_class *)NSNumber;
  id v6 = a2;
  id v7 = a1;
  id v8 = (id)[[v5 alloc] initWithDouble:a3];
  [v7 setProperty:v8 forKey:v6];
}

double AceObjectDoubleForProperty(void *a1, uint64_t a2)
{
  v2 = [a1 propertyForKey:a2];
  objc_opt_class();
  double v3 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v2 doubleValue];
    double v3 = v4;
  }

  return v3;
}

void AceObjectSetFloatForProperty(void *a1, void *a2, float a3)
{
  v5 = (objc_class *)NSNumber;
  id v6 = a2;
  id v7 = a1;
  id v8 = [v5 alloc];
  *(float *)&double v9 = a3;
  id v10 = (id)[v8 initWithFloat:v9];
  [v7 setProperty:v10 forKey:v6];
}

float AceObjectFloatForProperty(void *a1, uint64_t a2)
{
  v2 = [a1 propertyForKey:a2];
  objc_opt_class();
  float v3 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v2 floatValue];
    float v3 = v4;
  }

  return v3;
}

void AceObjectSetIntegerForProperty(void *a1, void *a2, uint64_t a3)
{
  v5 = (objc_class *)NSNumber;
  id v6 = a2;
  id v7 = a1;
  id v8 = (id)[[v5 alloc] initWithInteger:a3];
  [v7 setProperty:v8 forKey:v6];
}

void AceObjectSetBoolForProperty(void *a1, void *a2, uint64_t a3)
{
  v5 = (objc_class *)NSNumber;
  id v6 = a2;
  id v7 = a1;
  id v8 = (id)[[v5 alloc] initWithBool:a3];
  [v7 setProperty:v8 forKey:v6];
}

uint64_t AceObjectBoolForProperty(void *a1, uint64_t a2)
{
  v2 = [a1 propertyForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void AceObjectSetCopyingObjectForProperty(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = (id)[a3 copy];
  [v6 setProperty:v7 forKey:v5];
}

uint64_t AceObjectCopyingObjectForProperty(void *a1, const char *a2)
{
  return [a1 propertyForKey:a2];
}

id AceObjectAceObjectForProperty(void *a1, uint64_t a2)
{
  v2 = [a1 propertyForKey:a2];
  uint64_t v3 = +[AceObject aceObjectWithDictionary:v2];

  return v3;
}

void AceObjectSetAceObjectForProperty(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = [a3 dictionary];
  [v6 setProperty:v7 forKey:v5];
}

id AceObjectClassArrayForProperty(void *a1, uint64_t a2, uint64_t a3)
{
  float v4 = [a1 propertyForKey:a2];
  id v5 = +[AceObject aceObjectArrayWithDictionaryArray:v4 baseClass:a3];

  return v5;
}

id AceObjectProtocolArrayForProperty(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1 propertyForKey:a2];
  id v7 = +[AceObject aceObjectArrayWithDictionaryArray:v6 baseProtocol:v5];

  return v7;
}

void AceObjectSetArrayForProperty(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = +[AceObject dictionaryArrayWithAceObjectArray:a3];
  id v8 = (id)[v7 copy];

  [v6 setProperty:v8 forKey:v5];
}

id AceObjectClassArrayDictionaryForProperty(void *a1, uint64_t a2, uint64_t a3)
{
  float v4 = [a1 propertyForKey:a2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __AceObjectClassArrayDictionaryForProperty_block_invoke;
  v7[3] = &__block_descriptor_40_e20___NSArray_24__0_8_16lu32l8;
  v7[4] = a3;
  id v5 = objc_msgSend(v4, "_sa_mappedDictionaryWithBlock:", v7);

  return v5;
}

id __AceObjectClassArrayDictionaryForProperty_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[AceObject aceObjectArrayWithDictionaryArray:a3 baseClass:*(void *)(a1 + 32)];
}

id AceObjectProtocolArrayDictionaryForProperty(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1 propertyForKey:a2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __AceObjectProtocolArrayDictionaryForProperty_block_invoke;
  v10[3] = &unk_1E5CD7BA0;
  id v11 = v5;
  id v7 = v5;
  id v8 = objc_msgSend(v6, "_sa_mappedDictionaryWithBlock:", v10);

  return v8;
}

id __AceObjectProtocolArrayDictionaryForProperty_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[AceObject aceObjectArrayWithDictionaryArray:a3 baseProtocol:*(void *)(a1 + 32)];
}

void AceObjectSetAceObjectArrayDictionaryForProperty(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  objc_msgSend(a3, "_sa_mappedDictionaryWithBlock:", &__block_literal_global_257);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setProperty:v7 forKey:v5];
}

id __AceObjectSetAceObjectArrayDictionaryForProperty_block_invoke()
{
  return +[AceObject dictionaryArrayWithAceObjectArray:](AceObject, "dictionaryArrayWithAceObjectArray:");
}

id AceObjectClassDictionaryForProperty(void *a1, uint64_t a2, uint64_t a3)
{
  float v4 = [a1 propertyForKey:a2];
  id v5 = +[AceObject aceObjectDictionaryWithDictionary:v4 baseClass:a3];

  return v5;
}

id AceObjectProtocolDictionaryForProperty(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1 propertyForKey:a2];
  id v7 = +[AceObject aceObjectDictionaryWithDictionary:v6 baseProtocol:v5];

  return v7;
}

void AceObjectSetAceObjectDictionaryForProperty(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = +[AceObject dictionaryWithAceObjectDictionary:a3];
  [v6 setProperty:v7 forKey:v5];
}

id AceObjectURLForProperty(void *a1, uint64_t a2)
{
  v2 = [a1 propertyForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void AceObjectSetURLForProperty(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = [a3 absoluteString];
  [v6 setProperty:v7 forKey:v5];
}

id AceObjectURLArrayForProperty(void *a1, uint64_t a2)
{
  v2 = [a1 propertyForKey:a2];
  uint64_t v3 = objc_msgSend(v2, "_sa_mappedArrayWithBlock:", &__block_literal_global_261);

  return v3;
}

id __AceObjectURLArrayForProperty_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void AceObjectSetURLArrayForProperty(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  objc_msgSend(a3, "_sa_mappedArrayWithBlock:", &__block_literal_global_264);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setProperty:v7 forKey:v5];
}

uint64_t __AceObjectSetURLArrayForProperty_block_invoke(uint64_t a1, void *a2)
{
  return [a2 absoluteString];
}

uint64_t __AceObjectGetFilteredPlistKeys_block_invoke()
{
  qword_1EB4EC9C8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"$group", @"$class", @"aceId", @"refId", @"usefulnessScore", @"mutatingCommand", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t SACalendarRecurrenceFrequencyForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Daily"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Weekly"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Monthly"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Yearly"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *stringForSACalendarRecurrenceFrequency(int a1)
{
  if ((a1 - 1) > 3) {
    return 0;
  }
  else {
    return off_1E5CD7F48[a1 - 1];
  }
}

uint64_t SASSpeechFailureReasonForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Timeout"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Corrupt"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Invalid"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"EmptyResult"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Error"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"Retry"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Unsupported"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"QuotaExceeded"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"TrafficLimitExceeded"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"ApiQuotaLimitExceeded"])
  {
    uint64_t v2 = 10;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *stringForSASSpeechFailureReason(int a1)
{
  if ((a1 - 1) > 9) {
    return 0;
  }
  else {
    return off_1E5CD8238[a1 - 1];
  }
}

uint64_t SASCodecForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PCM_Mono_16Bit_8000Hz"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"PCM_Mono_16Bit_11025Hz"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"PCM_Mono_16Bit_16000Hz"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"PCM_Mono_16Bit_22050Hz"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"PCM_Mono_16Bit_32000Hz"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"Speex_NB_Quality7"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Speex_WB_Quality8"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"ALAC_Mono_8000Hz"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"ALAC_Mono_16000Hz"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"OPUS_Mono_8000Hz"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"OPUS_Mono_16000Hz"])
  {
    uint64_t v2 = 11;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *stringForSASCodec(int a1)
{
  if ((a1 - 1) > 0xA) {
    return 0;
  }
  else {
    return off_1E5CD8528[a1 - 1];
  }
}

uint64_t SAAlarmDayOfWeekForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Never"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Sunday"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Monday"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Tuesday"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Wednesday"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"Thursday"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Friday"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"Saturday"])
  {
    uint64_t v2 = 8;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *stringForSAAlarmDayOfWeek(int a1)
{
  if ((a1 - 1) > 7) {
    return 0;
  }
  else {
    return off_1E5CD8C38[a1 - 1];
  }
}

uint64_t SAMPPlaybackPositionForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"NextItem"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"PreviousItem"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Beginning"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *stringForSAMPPlaybackPosition(int a1)
{
  if ((a1 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E5CD9A78[a1 - 1];
  }
}

uint64_t SAMPPlayStateForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Playing"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Paused"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Stopped"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Interrupted"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Muted"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *stringForSAMPPlayState(int a1)
{
  if ((a1 - 1) > 4) {
    return 0;
  }
  else {
    return off_1E5CD9B18[a1 - 1];
  }
}

uint64_t SAMPSearchPropertyForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Album"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Artist"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Composer"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Genre"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Title"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"RadioStation"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"PlaylistDateCreatedValue"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"PlaylistDateModifiedValue"])
  {
    uint64_t v2 = 8;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *stringForSAMPSearchProperty(int a1)
{
  if ((a1 - 1) > 7) {
    return 0;
  }
  else {
    return off_1E5CD9C60[a1 - 1];
  }
}

uint64_t SAMPTypeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Album"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Artist"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"AudioBook"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Compilation"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Composer"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"GeniusMix"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Genre"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"ITunesU"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"MusicVideo"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"Playlist"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"Podcast"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"PodcastCollection"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"PodcastStation"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"RadioStation"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"Song"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"TVShow"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"Video"])
  {
    uint64_t v2 = 17;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *stringForSAMPType(int a1)
{
  if ((a1 - 1) > 0x10) {
    return 0;
  }
  else {
    return off_1E5CD9ED0[a1 - 1];
  }
}

uint64_t SAReminderDayOfWeekForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Sunday"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Monday"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Tuesday"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Wednesday"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Thursday"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"Friday"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Saturday"])
  {
    uint64_t v2 = 7;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *stringForSAReminderDayOfWeek(int a1)
{
  if ((a1 - 1) > 6) {
    return 0;
  }
  else {
    return off_1E5CDB748[a1 - 1];
  }
}

uint64_t SAEmailSearchStatusForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Read"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Unread"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *stringForSAEmailSearchStatus(int a1)
{
  id v1 = @"Unread";
  if (a1 != 2) {
    id v1 = 0;
  }
  if (a1 == 1) {
    return @"Read";
  }
  else {
    return v1;
  }
}

uint64_t SAEmailCreateTypeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"New"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Reply"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Forward"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *stringForSAEmailCreateType(int a1)
{
  if ((a1 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E5CE4458[a1 - 1];
  }
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1F40D9030]();
}

uint64_t _CFPropertyListCreateSingleValue()
{
  return MEMORY[0x1F40D9048]();
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}
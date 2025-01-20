@interface FTQssMessage
+ (Class)container_message_immutableClassForType:(int64_t)a3;
+ (int64_t)container_message_typeForImmutableObject:(id)a3;
- (FLTBFBufferAccessor)container_message;
- (FTApgPronGuessMessage)container_messageAsFTApgPronGuessMessage;
- (FTAsrCorrectionsValidatorMessage)container_messageAsFTAsrCorrectionsValidatorMessage;
- (FTAsrErrorBlamerMessage)container_messageAsFTAsrErrorBlamerMessage;
- (FTAsrGraphemeToPhonemeMessage)container_messageAsFTAsrGraphemeToPhonemeMessage;
- (FTAsrItnMessage)container_messageAsFTAsrItnMessage;
- (FTAsrKeywordFinderMessage)container_messageAsFTAsrKeywordFinderMessage;
- (FTAsrPostItnHammerMessage)container_messageAsFTAsrPostItnHammerMessage;
- (FTAsrRecognitionMessage)container_messageAsFTAsrRecognitionMessage;
- (FTAsrTextNormalizationMessage)container_messageAsFTAsrTextNormalizationMessage;
- (FTBlazarBatchTranslationMessage)container_messageAsFTBlazarBatchTranslationMessage;
- (FTBlazarMultiUserMessage)container_messageAsFTBlazarMultiUserMessage;
- (FTBlazarMultilingualMessage)container_messageAsFTBlazarMultilingualMessage;
- (FTBlazarServiceDiscoveryMessage)container_messageAsFTBlazarServiceDiscoveryMessage;
- (FTBlazarSpeechTranslationMessage)container_messageAsFTBlazarSpeechTranslationMessage;
- (FTBlazarTextToSpeechRouterMessage)container_messageAsFTBlazarTextToSpeechRouterMessage;
- (FTBlazarTextToSpeechRouterStreamingMessage)container_messageAsFTBlazarTextToSpeechRouterStreamingMessage;
- (FTDisableSessionLog)disable_session_log;
- (FTErrorMessage)error_message;
- (FTLmtLmScorerMessage)container_messageAsFTLmtLmScorerMessage;
- (FTMtTranslationMessage)container_messageAsFTMtTranslationMessage;
- (FTNapgCreateLanguageProfileMessage)container_messageAsFTNapgCreateLanguageProfileMessage;
- (FTNlShortcutFuzzyMatchMessage)container_messageAsFTNlShortcutFuzzyMatchMessage;
- (FTQssMessage)initWithFlatbuffData:(id)a3;
- (FTQssMessage)initWithFlatbuffData:(id)a3 root:(const QssMessage *)a4;
- (FTQssMessage)initWithFlatbuffData:(id)a3 root:(const QssMessage *)a4 verify:(BOOL)a5;
- (FTSlsLanguageDetectionMessage)container_messageAsFTSlsLanguageDetectionMessage;
- (FTTtsTextToSpeechMessage)container_messageAsFTTtsTextToSpeechMessage;
- (FTTtsTextToSpeechSpeechFeatureMessage)container_messageAsFTTtsTextToSpeechSpeechFeatureMessage;
- (FTTtsTextToSpeechStreamingMessage)container_messageAsFTTtsTextToSpeechStreamingMessage;
- (Offset<siri::speech::qss_fb::QssMessage>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)container_message_type;
@end

@implementation FTQssMessage

- (FTQssMessage)initWithFlatbuffData:(id)a3
{
  return [(FTQssMessage *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTQssMessage *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTQssMessage)initWithFlatbuffData:(id)a3 root:(const QssMessage *)a4
{
  return [(FTQssMessage *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTQssMessage)initWithFlatbuffData:(id)a3 root:(const QssMessage *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTQssMessage;
  v10 = [(FTQssMessage *)&v30 init];
  v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_15;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)[*p_data bytes];
      a4 = (const QssMessage *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_15;
      }
      uint64_t v18 = [*p_data bytes];
      uint64_t v19 = [*p_data length];
      uint64_t v25 = v18;
      uint64_t v26 = v19;
      long long v27 = xmmword_26027B7E0;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      root = (siri::speech::qss_fb::QssMessage *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::QssMessage::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
        {
LABEL_15:
          v23 = 0;
          goto LABEL_16;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_16:

  return v23;
}

- (FTErrorMessage)error_message
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"error_message"];
  if (!v3)
  {
    v4 = [FTErrorMessage alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTErrorMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"error_message"];
  }
  return v3;
}

- (FTDisableSessionLog)disable_session_log
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"disable_session_log"];
  if (!v3)
  {
    v4 = [FTDisableSessionLog alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTDisableSessionLog *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"disable_session_log"];
  }
  return v3;
}

- (int64_t)container_message_type
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return root[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (FTApgPronGuessMessage)container_messageAsFTApgPronGuessMessage
{
  if ([(FTQssMessage *)self container_message_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTApgPronGuessMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTApgPronGuessMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrRecognitionMessage)container_messageAsFTAsrRecognitionMessage
{
  if ([(FTQssMessage *)self container_message_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTAsrRecognitionMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTAsrRecognitionMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrErrorBlamerMessage)container_messageAsFTAsrErrorBlamerMessage
{
  if ([(FTQssMessage *)self container_message_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTAsrErrorBlamerMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTAsrErrorBlamerMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrItnMessage)container_messageAsFTAsrItnMessage
{
  if ([(FTQssMessage *)self container_message_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTAsrItnMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTAsrItnMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrTextNormalizationMessage)container_messageAsFTAsrTextNormalizationMessage
{
  if ([(FTQssMessage *)self container_message_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTAsrTextNormalizationMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTAsrTextNormalizationMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrPostItnHammerMessage)container_messageAsFTAsrPostItnHammerMessage
{
  if ([(FTQssMessage *)self container_message_type] == 6)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTAsrPostItnHammerMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTAsrPostItnHammerMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrKeywordFinderMessage)container_messageAsFTAsrKeywordFinderMessage
{
  if ([(FTQssMessage *)self container_message_type] == 7)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTAsrKeywordFinderMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTAsrKeywordFinderMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrCorrectionsValidatorMessage)container_messageAsFTAsrCorrectionsValidatorMessage
{
  if ([(FTQssMessage *)self container_message_type] == 8)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTAsrCorrectionsValidatorMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTAsrCorrectionsValidatorMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrGraphemeToPhonemeMessage)container_messageAsFTAsrGraphemeToPhonemeMessage
{
  if ([(FTQssMessage *)self container_message_type] == 9)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTAsrGraphemeToPhonemeMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTAsrGraphemeToPhonemeMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarMultiUserMessage)container_messageAsFTBlazarMultiUserMessage
{
  if ([(FTQssMessage *)self container_message_type] == 10)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTBlazarMultiUserMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTBlazarMultiUserMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarMultilingualMessage)container_messageAsFTBlazarMultilingualMessage
{
  if ([(FTQssMessage *)self container_message_type] == 11)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTBlazarMultilingualMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTBlazarMultilingualMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarSpeechTranslationMessage)container_messageAsFTBlazarSpeechTranslationMessage
{
  if ([(FTQssMessage *)self container_message_type] == 12)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTBlazarSpeechTranslationMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTBlazarSpeechTranslationMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarBatchTranslationMessage)container_messageAsFTBlazarBatchTranslationMessage
{
  if ([(FTQssMessage *)self container_message_type] == 13)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTBlazarBatchTranslationMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTBlazarBatchTranslationMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarTextToSpeechRouterMessage)container_messageAsFTBlazarTextToSpeechRouterMessage
{
  if ([(FTQssMessage *)self container_message_type] == 14)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTBlazarTextToSpeechRouterMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTBlazarTextToSpeechRouterMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarTextToSpeechRouterStreamingMessage)container_messageAsFTBlazarTextToSpeechRouterStreamingMessage
{
  if ([(FTQssMessage *)self container_message_type] == 15)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTBlazarTextToSpeechRouterStreamingMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTBlazarTextToSpeechRouterStreamingMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarServiceDiscoveryMessage)container_messageAsFTBlazarServiceDiscoveryMessage
{
  if ([(FTQssMessage *)self container_message_type] == 16)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTBlazarServiceDiscoveryMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTBlazarServiceDiscoveryMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTLmtLmScorerMessage)container_messageAsFTLmtLmScorerMessage
{
  if ([(FTQssMessage *)self container_message_type] == 17)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTLmtLmScorerMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTLmtLmScorerMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTNapgCreateLanguageProfileMessage)container_messageAsFTNapgCreateLanguageProfileMessage
{
  if ([(FTQssMessage *)self container_message_type] == 18)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTNapgCreateLanguageProfileMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTNapgCreateLanguageProfileMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTMtTranslationMessage)container_messageAsFTMtTranslationMessage
{
  if ([(FTQssMessage *)self container_message_type] == 19)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTMtTranslationMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTMtTranslationMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTTtsTextToSpeechMessage)container_messageAsFTTtsTextToSpeechMessage
{
  if ([(FTQssMessage *)self container_message_type] == 20)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTTtsTextToSpeechMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTTtsTextToSpeechMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTTtsTextToSpeechStreamingMessage)container_messageAsFTTtsTextToSpeechStreamingMessage
{
  if ([(FTQssMessage *)self container_message_type] == 21)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTTtsTextToSpeechStreamingMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTTtsTextToSpeechStreamingMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTTtsTextToSpeechSpeechFeatureMessage)container_messageAsFTTtsTextToSpeechSpeechFeatureMessage
{
  if ([(FTQssMessage *)self container_message_type] == 22)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTTtsTextToSpeechSpeechFeatureMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTTtsTextToSpeechSpeechFeatureMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTNlShortcutFuzzyMatchMessage)container_messageAsFTNlShortcutFuzzyMatchMessage
{
  if ([(FTQssMessage *)self container_message_type] == 23)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTNlShortcutFuzzyMatchMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTNlShortcutFuzzyMatchMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSlsLanguageDetectionMessage)container_messageAsFTSlsLanguageDetectionMessage
{
  if ([(FTQssMessage *)self container_message_type] == 24)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"container_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSlsLanguageDetectionMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSlsLanguageDetectionMessage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"container_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FLTBFBufferAccessor)container_message
{
  switch([(FTQssMessage *)self container_message_type])
  {
    case 1:
      v3 = [(FTQssMessage *)self container_messageAsFTApgPronGuessMessage];
      break;
    case 2:
      v3 = [(FTQssMessage *)self container_messageAsFTAsrRecognitionMessage];
      break;
    case 3:
      v3 = [(FTQssMessage *)self container_messageAsFTAsrErrorBlamerMessage];
      break;
    case 4:
      v3 = [(FTQssMessage *)self container_messageAsFTAsrItnMessage];
      break;
    case 5:
      v3 = [(FTQssMessage *)self container_messageAsFTAsrTextNormalizationMessage];
      break;
    case 6:
      v3 = [(FTQssMessage *)self container_messageAsFTAsrPostItnHammerMessage];
      break;
    case 7:
      v3 = [(FTQssMessage *)self container_messageAsFTAsrKeywordFinderMessage];
      break;
    case 8:
      v3 = [(FTQssMessage *)self container_messageAsFTAsrCorrectionsValidatorMessage];
      break;
    case 9:
      v3 = [(FTQssMessage *)self container_messageAsFTAsrGraphemeToPhonemeMessage];
      break;
    case 10:
      v3 = [(FTQssMessage *)self container_messageAsFTBlazarMultiUserMessage];
      break;
    case 11:
      v3 = [(FTQssMessage *)self container_messageAsFTBlazarMultilingualMessage];
      break;
    case 12:
      v3 = [(FTQssMessage *)self container_messageAsFTBlazarSpeechTranslationMessage];
      break;
    case 13:
      v3 = [(FTQssMessage *)self container_messageAsFTBlazarBatchTranslationMessage];
      break;
    case 14:
      v3 = [(FTQssMessage *)self container_messageAsFTBlazarTextToSpeechRouterMessage];
      break;
    case 15:
      v3 = [(FTQssMessage *)self container_messageAsFTBlazarTextToSpeechRouterStreamingMessage];
      break;
    case 16:
      v3 = [(FTQssMessage *)self container_messageAsFTBlazarServiceDiscoveryMessage];
      break;
    case 17:
      v3 = [(FTQssMessage *)self container_messageAsFTLmtLmScorerMessage];
      break;
    case 18:
      v3 = [(FTQssMessage *)self container_messageAsFTNapgCreateLanguageProfileMessage];
      break;
    case 19:
      v3 = [(FTQssMessage *)self container_messageAsFTMtTranslationMessage];
      break;
    case 20:
      v3 = [(FTQssMessage *)self container_messageAsFTTtsTextToSpeechMessage];
      break;
    case 21:
      v3 = [(FTQssMessage *)self container_messageAsFTTtsTextToSpeechStreamingMessage];
      break;
    case 22:
      v3 = [(FTQssMessage *)self container_messageAsFTTtsTextToSpeechSpeechFeatureMessage];
      break;
    case 23:
      v3 = [(FTQssMessage *)self container_messageAsFTNlShortcutFuzzyMatchMessage];
      break;
    case 24:
      v3 = [(FTQssMessage *)self container_messageAsFTSlsLanguageDetectionMessage];
      break;
    default:
      v3 = 0;
      break;
  }
  return (FLTBFBufferAccessor *)v3;
}

+ (Class)container_message_immutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x17)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (int64_t)container_message_typeForImmutableObject:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 12;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 13;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 14;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 15;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 16;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 17;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 18;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 19;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 20;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 21;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 22;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 23;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 24;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::QssMessage>)addObjectToBuffer:(void *)a3
{
  BOOL v5 = [(FTQssMessage *)self error_message];
  int v6 = [v5 addObjectToBuffer:a3];

  uint64_t v7 = [(FTQssMessage *)self disable_session_log];
  int v8 = [v7 addObjectToBuffer:a3];

  unsigned __int8 v9 = [(FTQssMessage *)self container_message_type];
  if ([(FTQssMessage *)self container_message_type] == 1)
  {
    v10 = [(FTQssMessage *)self container_messageAsFTApgPronGuessMessage];
    int v11 = [v10 addObjectToBuffer:a3];
  }
  else
  {
    int v11 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 2)
  {
    v12 = [(FTQssMessage *)self container_messageAsFTAsrRecognitionMessage];
    int v13 = [v12 addObjectToBuffer:a3];
  }
  else
  {
    int v13 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 3)
  {
    unint64_t v14 = [(FTQssMessage *)self container_messageAsFTAsrErrorBlamerMessage];
    int v15 = [v14 addObjectToBuffer:a3];
  }
  else
  {
    int v15 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 4)
  {
    v16 = [(FTQssMessage *)self container_messageAsFTAsrItnMessage];
    int v17 = [v16 addObjectToBuffer:a3];
  }
  else
  {
    int v17 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 5)
  {
    uint64_t v18 = [(FTQssMessage *)self container_messageAsFTAsrTextNormalizationMessage];
    int v60 = [v18 addObjectToBuffer:a3];
  }
  else
  {
    int v60 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 6)
  {
    uint64_t v19 = [(FTQssMessage *)self container_messageAsFTAsrPostItnHammerMessage];
    int v59 = [v19 addObjectToBuffer:a3];
  }
  else
  {
    int v59 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 7)
  {
    v20 = [(FTQssMessage *)self container_messageAsFTAsrKeywordFinderMessage];
    int v58 = [v20 addObjectToBuffer:a3];
  }
  else
  {
    int v58 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 8)
  {
    uint64_t v21 = [(FTQssMessage *)self container_messageAsFTAsrCorrectionsValidatorMessage];
    int v57 = [v21 addObjectToBuffer:a3];
  }
  else
  {
    int v57 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 9)
  {
    v22 = [(FTQssMessage *)self container_messageAsFTAsrGraphemeToPhonemeMessage];
    int v56 = [v22 addObjectToBuffer:a3];
  }
  else
  {
    int v56 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 10)
  {
    v23 = [(FTQssMessage *)self container_messageAsFTBlazarMultiUserMessage];
    int v55 = [v23 addObjectToBuffer:a3];
  }
  else
  {
    int v55 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 11)
  {
    v24 = [(FTQssMessage *)self container_messageAsFTBlazarMultilingualMessage];
    int v54 = [v24 addObjectToBuffer:a3];
  }
  else
  {
    int v54 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 12)
  {
    uint64_t v25 = [(FTQssMessage *)self container_messageAsFTBlazarSpeechTranslationMessage];
    int v53 = [v25 addObjectToBuffer:a3];
  }
  else
  {
    int v53 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 13)
  {
    uint64_t v26 = [(FTQssMessage *)self container_messageAsFTBlazarBatchTranslationMessage];
    int v52 = [v26 addObjectToBuffer:a3];
  }
  else
  {
    int v52 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 14)
  {
    long long v27 = [(FTQssMessage *)self container_messageAsFTBlazarTextToSpeechRouterMessage];
    int v51 = [v27 addObjectToBuffer:a3];
  }
  else
  {
    int v51 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 15)
  {
    uint64_t v28 = [(FTQssMessage *)self container_messageAsFTBlazarTextToSpeechRouterStreamingMessage];
    int v50 = [v28 addObjectToBuffer:a3];
  }
  else
  {
    int v50 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 16)
  {
    uint64_t v29 = [(FTQssMessage *)self container_messageAsFTBlazarServiceDiscoveryMessage];
    int v49 = [v29 addObjectToBuffer:a3];
  }
  else
  {
    int v49 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 17)
  {
    objc_super v30 = [(FTQssMessage *)self container_messageAsFTLmtLmScorerMessage];
    int v48 = [v30 addObjectToBuffer:a3];
  }
  else
  {
    int v48 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 18)
  {
    v31 = [(FTQssMessage *)self container_messageAsFTNapgCreateLanguageProfileMessage];
    int v47 = [v31 addObjectToBuffer:a3];
  }
  else
  {
    int v47 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 19)
  {
    v32 = [(FTQssMessage *)self container_messageAsFTMtTranslationMessage];
    int v46 = [v32 addObjectToBuffer:a3];
  }
  else
  {
    int v46 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 20)
  {
    v33 = [(FTQssMessage *)self container_messageAsFTTtsTextToSpeechMessage];
    int v45 = [v33 addObjectToBuffer:a3];
  }
  else
  {
    int v45 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 21)
  {
    v34 = [(FTQssMessage *)self container_messageAsFTTtsTextToSpeechStreamingMessage];
    int v44 = [v34 addObjectToBuffer:a3];
  }
  else
  {
    int v44 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 22)
  {
    v35 = [(FTQssMessage *)self container_messageAsFTTtsTextToSpeechSpeechFeatureMessage];
    int v43 = [v35 addObjectToBuffer:a3];
  }
  else
  {
    int v43 = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 23)
  {
    v36 = [(FTQssMessage *)self container_messageAsFTNlShortcutFuzzyMatchMessage];
    HIDWORD(v40) = [v36 addObjectToBuffer:a3];
  }
  else
  {
    HIDWORD(v40) = 0;
  }
  if ([(FTQssMessage *)self container_message_type] == 24)
  {
    v37 = [(FTQssMessage *)self container_messageAsFTSlsLanguageDetectionMessage];
    LODWORD(v40) = [v37 addObjectToBuffer:a3];
  }
  else
  {
    LODWORD(v40) = 0;
  }
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v38 = *((void *)a3 + 4);
  uint64_t v61 = *((void *)a3 + 6);
  uint64_t v62 = *((void *)a3 + 5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v6);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v8);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 8, v9, 0);
  if ([(FTQssMessage *)self container_message_type] == 1) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v11);
  }
  if ([(FTQssMessage *)self container_message_type] == 2) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v13);
  }
  if ([(FTQssMessage *)self container_message_type] == 3) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v15);
  }
  if ([(FTQssMessage *)self container_message_type] == 4) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v17);
  }
  if ([(FTQssMessage *)self container_message_type] == 5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v60);
  }
  if ([(FTQssMessage *)self container_message_type] == 6) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v59);
  }
  if ([(FTQssMessage *)self container_message_type] == 7) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v58);
  }
  if ([(FTQssMessage *)self container_message_type] == 8) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v57);
  }
  if ([(FTQssMessage *)self container_message_type] == 9) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v56);
  }
  if ([(FTQssMessage *)self container_message_type] == 10) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v55);
  }
  if ([(FTQssMessage *)self container_message_type] == 11) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v54);
  }
  if ([(FTQssMessage *)self container_message_type] == 12) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v53);
  }
  if ([(FTQssMessage *)self container_message_type] == 13) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v52);
  }
  if ([(FTQssMessage *)self container_message_type] == 14) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v51);
  }
  if ([(FTQssMessage *)self container_message_type] == 15) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v50);
  }
  if ([(FTQssMessage *)self container_message_type] == 16) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v49);
  }
  if ([(FTQssMessage *)self container_message_type] == 17) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v48);
  }
  if ([(FTQssMessage *)self container_message_type] == 18) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v47);
  }
  if ([(FTQssMessage *)self container_message_type] == 19) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v46);
  }
  if ([(FTQssMessage *)self container_message_type] == 20) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v45);
  }
  if ([(FTQssMessage *)self container_message_type] == 21) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v44);
  }
  if ([(FTQssMessage *)self container_message_type] == 22) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v43);
  }
  if ([(FTQssMessage *)self container_message_type] == 23) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v42);
  }
  if ([(FTQssMessage *)self container_message_type] == 24) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v41);
  }
  return (Offset<siri::speech::qss_fb::QssMessage>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v38- (unsigned __int16)v61+ (unsigned __int16)v62);
}

- (id)flatbuffData
{
  uint64_t v3 = 0;
  char v4 = 0;
  long long v5 = xmmword_26027B7F0;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  __int16 v10 = 256;
  uint64_t v11 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTQssMessage *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__28__FTQssMessage_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
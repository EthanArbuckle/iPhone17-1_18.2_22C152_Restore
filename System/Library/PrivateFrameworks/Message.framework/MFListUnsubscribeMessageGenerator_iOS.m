@interface MFListUnsubscribeMessageGenerator_iOS
+ (id)deliveryForCommand:(id)a3;
+ (id)senderForCommand:(id)a3;
@end

@implementation MFListUnsubscribeMessageGenerator_iOS

+ (id)deliveryForCommand:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"MFListUnsubscribeMessageGenerator_iOS.m", 22, @"Invalid parameter not satisfying: %@", @"command" object file lineNumber description];
  }
  v6 = [v5 mailtoValues];
  if (!v6)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"MFListUnsubscribeMessageGenerator_iOS.m", 24, @"Invalid parameter not satisfying: %@", @"mailtoValues" object file lineNumber description];
  }
  v7 = [v6 account];
  id v8 = objc_alloc_init(MEMORY[0x1E4F73558]);
  v9 = [a1 messageHeadersWithCommand:v5 headersFactory:v8];

  v10 = [a1 localizedBodyForCommand:v5];
  v11 = objc_alloc_init(MFPlainTextDocument);
  v12 = [v6 body];

  if (v12)
  {
    v13 = NSString;
    v14 = [v6 body];
    v15 = [v13 stringWithFormat:@"%@\n\n%@", v14, v10];
    [(MFPlainTextDocument *)v11 appendString:v15 withQuoteLevel:0];
  }
  else
  {
    [(MFPlainTextDocument *)v11 appendString:v10 withQuoteLevel:0];
  }
  v21[0] = v11;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v17 = [[MFOutgoingMessageDelivery alloc] initWithHeaders:v9 mixedContent:v16 textPartsAreHTML:0];
  [(MFOutgoingMessageDelivery *)v17 setArchiveAccount:v7];

  return v17;
}

+ (id)senderForCommand:(id)a3
{
  id v3 = a3;
  v4 = [v3 mailtoValues];
  id v5 = [v4 account];

  id v6 = [v3 sender];
  v7 = [v6 emailAddressValue];
  id v8 = [v7 simpleAddress];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v6 stringValue];
  }
  v11 = v10;

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__13;
  v25 = __Block_byref_object_dispose__13;
  id v26 = (id)0xAAAAAAAAAAAAAAAALL;
  v12 = [v5 defaultEmailAddress];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v5 firstEmailAddress];
  }
  id v26 = v14;

  if (v11)
  {
    v15 = [v5 emailAddressesAndAliases];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__MFListUnsubscribeMessageGenerator_iOS_senderForCommand___block_invoke;
    v18[3] = &unk_1E5D3D8F8;
    id v19 = v11;
    v20 = &v21;
    [v15 enumerateKeysAndObjectsUsingBlock:v18];
  }
  id v16 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v16;
}

@end
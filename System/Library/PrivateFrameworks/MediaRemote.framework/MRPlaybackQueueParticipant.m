@interface MRPlaybackQueueParticipant
+ (id)expectedIdentifierForUserIdentity:(id)a3 withRandomData:(id)a4;
+ (void)fetchParticipantsWithRequest:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)fetchPlaybackQueueParticipantIdentifierForLocalAccountWithDSID:(id)a3 completion:(id)a4;
- (MRPlaybackQueueParticipant)initWithIdentifier:(id)a3 identity:(id)a4;
- (MRPlaybackQueueParticipant)initWithProtobuf:(id)a3;
- (MRPlaybackQueueParticipant)initWithProtobufData:(id)a3;
- (MRUserIdentity)identity;
- (NSData)protobufData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protobufWithEncoding:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentity:(id)a3;
@end

@implementation MRPlaybackQueueParticipant

void __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v6) {
      id v9 = v6;
    }
    else {
      id v9 = v5;
    }
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueParticipantRequest]<%@> Response: %@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (![v5 isResolved])
  {
    if (v6) {
      Error = 0;
    }
    else {
      Error = (void *)MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    }
    v17 = *(NSObject **)(a1 + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_22;
    v18[3] = &unk_1E57D0EA8;
    id v21 = *(id *)(a1 + 56);
    id v19 = v6;
    id v20 = Error;
    id v11 = Error;
    dispatch_async(v17, v18);

    uint64_t v14 = v21;
LABEL_11:

    goto LABEL_12;
  }
  v7 = [v5 client];
  char v8 = [v7 isSystemMediaApplication];

  if (v8)
  {
    id v9 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v10;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueParticipantRequest]<%@> for playerPath: %@", buf, 0x16u);
    }

    MRGetSharedService();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = *(void *)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_20;
    v22[3] = &unk_1E57D4630;
    uint64_t v13 = *(void *)(a1 + 48);
    id v23 = *(id *)(a1 + 40);
    id v24 = *(id *)(a1 + 56);
    [v11 fetchParticipantsWithRequest:v13 playerPath:v5 queue:v12 completion:v22];

    uint64_t v14 = v23;
    goto LABEL_11;
  }
  v16 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D0FC0;
  id v26 = *(id *)(a1 + 56);
  dispatch_async(v16, block);
  id v11 = v26;
LABEL_12:
}

+ (void)fetchParticipantsWithRequest:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)MEMORY[0x1E4F29128];
  id v13 = a4;
  uint64_t v14 = [v12 UUID];
  v15 = [v14 UUIDString];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke;
  v20[3] = &unk_1E57D4658;
  id v21 = v10;
  id v22 = v15;
  id v23 = v9;
  id v24 = v11;
  id v16 = v9;
  id v17 = v15;
  id v18 = v11;
  id v19 = v10;
  MRMediaRemoteNowPlayingResolvePlayerPath(v13, v19, v20);
}

- (MRPlaybackQueueParticipant)initWithIdentifier:(id)a3 identity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRPlaybackQueueParticipant;
  id v9 = [(MRPlaybackQueueParticipant *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a4);
    objc_storeStrong((id *)&v10->_identifier, a3);
  }

  return v10;
}

- (MRPlaybackQueueParticipant)initWithProtobuf:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 identifier];
    id v6 = [MRUserIdentity alloc];
    id v7 = [v4 identity];

    id v8 = [(MRUserIdentity *)v6 initWithProtobuf:v7];
    self = [(MRPlaybackQueueParticipant *)self initWithIdentifier:v5 identity:v8];

    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (MRPlaybackQueueParticipant)initWithProtobufData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[_MRPlaybackQueueParticipantProtobuf alloc] initWithData:v4];

    self = [(MRPlaybackQueueParticipant *)self initWithProtobuf:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)protobufWithEncoding:(int64_t)a3
{
  id v4 = objc_alloc_init(_MRPlaybackQueueParticipantProtobuf);
  id v5 = [(MRPlaybackQueueParticipant *)self identity];
  id v6 = [v5 protobuf];
  [(_MRPlaybackQueueParticipantProtobuf *)v4 setIdentity:v6];

  id v7 = [(MRPlaybackQueueParticipant *)self identifier];
  [(_MRPlaybackQueueParticipantProtobuf *)v4 setIdentifier:v7];

  return v4;
}

- (NSData)protobufData
{
  v2 = [(MRPlaybackQueueParticipant *)self protobufWithEncoding:0];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MRPlaybackQueueParticipant alloc];
  id v5 = [(MRPlaybackQueueParticipant *)self protobufWithEncoding:0];
  id v6 = (void *)[v5 copy];
  id v7 = [(MRPlaybackQueueParticipant *)v4 initWithProtobuf:v6];

  return v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRPlaybackQueueParticipant *)self identifier];
  id v6 = [(MRPlaybackQueueParticipant *)self identity];
  id v7 = (void *)[v3 initWithFormat:@"<%@: identifier=%@, identity=%@", v4, v5, v6];

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(MRPlaybackQueueParticipant *)self identifier];
  [v3 setObject:v4 forKeyedSubscript:@"identifier"];

  id v5 = [(MRPlaybackQueueParticipant *)self identity];
  [v3 setObject:v5 forKeyedSubscript:@"identity"];

  return (NSDictionary *)v3;
}

+ (void)fetchPlaybackQueueParticipantIdentifierForLocalAccountWithDSID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = MRGetSharedService();
  id v8 = MRGroupSessionSubsystemGetNotificationQueue();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__MRPlaybackQueueParticipant_fetchPlaybackQueueParticipantIdentifierForLocalAccountWithDSID_completion___block_invoke;
  v10[3] = &unk_1E57D4608;
  id v11 = v5;
  id v9 = v5;
  [v7 userIdentityForDSID:v6 queue:v8 completion:v10];
}

void __104__MRPlaybackQueueParticipant_fetchPlaybackQueueParticipantIdentifierForLocalAccountWithDSID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = +[MRPlaybackQueueParticipant expectedIdentifierForUserIdentity:a2 withRandomData:0];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

uint64_t __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_22(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[4];
  if (!v3) {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 + 16))(v2, 0, v3);
}

+ (id)expectedIdentifierForUserIdentity:(id)a3 withRandomData:(id)a4
{
  v69[0] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 identifier];
  id v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 stringByAppendingString:v6];

    id v8 = (void *)v9;
  }
  id v10 = v8;
  memset(v63, 0, sizeof(v63));
  CC_SHA1_Init((CC_SHA1_CTX *)v63);
  id v11 = v10;
  CC_SHA1_Update((CC_SHA1_CTX *)v63, (const void *)[v11 UTF8String], objc_msgSend(v11, "length"));

  memset(&v64[8], 0, 64);
  *(void *)v64 = 4001;
  CC_SHA1_Final(&v64[8], (CC_SHA1_CTX *)v63);
  v65[0] = *(_OWORD *)v64;
  v65[1] = *(_OWORD *)&v64[16];
  v65[2] = *(_OWORD *)&v64[32];
  v65[3] = *(_OWORD *)&v64[48];
  uint64_t v66 = *(void *)&v64[64];
  if (*(uint64_t *)v64 > 3999)
  {
    if (*(uint64_t *)v64 > 4255)
    {
      if (*(void *)v64 == 4256)
      {
        v52 = (unsigned __int8 *)v65 + 8;
        v53 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v54 = v53;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v56 = *v52++;
          v57 = &v53[i];
          char *v57 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v56 >> 4];
          v57[1] = MSVFastHexStringFromBytes_hexCharacters[v56 & 0xF];
        }
        id v24 = [NSString alloc];
        v25 = v54;
        uint64_t v26 = 64;
      }
      else
      {
        if (*(void *)v64 != 4512) {
          goto LABEL_46;
        }
        uint64_t v31 = (unsigned __int8 *)v65 + 8;
        v32 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v33 = v32;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v35 = *v31++;
          v36 = &v32[j];
          char *v36 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v35 >> 4];
          v36[1] = MSVFastHexStringFromBytes_hexCharacters[v35 & 0xF];
        }
        id v24 = [NSString alloc];
        v25 = v33;
        uint64_t v26 = 128;
      }
    }
    else if (*(void *)v64 == 4000)
    {
      v42 = (unsigned __int8 *)v65 + 8;
      v43 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v44 = v43;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v46 = *v42++;
        v47 = &v43[k];
        char *v47 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v46 >> 4];
        v47[1] = MSVFastHexStringFromBytes_hexCharacters[v46 & 0xF];
      }
      id v24 = [NSString alloc];
      v25 = v44;
      uint64_t v26 = 32;
    }
    else
    {
      if (*(void *)v64 != 4001) {
        goto LABEL_46;
      }
      id v18 = (unsigned __int8 *)v65 + 8;
      id v19 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      id v20 = v19;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v22 = *v18++;
        id v23 = &v19[m];
        *id v23 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v22 >> 4];
        v23[1] = MSVFastHexStringFromBytes_hexCharacters[v22 & 0xF];
      }
      id v24 = [NSString alloc];
      v25 = v20;
      uint64_t v26 = 40;
    }
  }
  else
  {
    if (*(uint64_t *)v64 <= 2999)
    {
      if (*(void *)v64 == 1000)
      {
        uint64_t v37 = *((void *)&v65[0] + 1);
        v38 = (UInt8 *)&v68;
        uint64_t quot = *((void *)&v65[0] + 1);
        do
        {
          lldiv_t v40 = lldiv(quot, 10);
          uint64_t quot = v40.quot;
          if (v40.rem >= 0) {
            LOBYTE(v41) = v40.rem;
          }
          else {
            uint64_t v41 = -v40.rem;
          }
          *v38-- = v41 + 48;
        }
        while (v40.quot);
        if (v37 < 0) {
          UInt8 *v38 = 45;
        }
        else {
          ++v38;
        }
        CFIndex v16 = (char *)v69 - (char *)v38;
        id v17 = v38;
        goto LABEL_49;
      }
      if (*(void *)v64 == 2000)
      {
        uint64_t v12 = 0;
        uint64_t v13 = DWORD2(v65[0]);
        do
        {
          ldiv_t v14 = ldiv(v13, 10);
          uint64_t v13 = v14.quot;
          if (v14.rem >= 0) {
            LOBYTE(v15) = v14.rem;
          }
          else {
            uint64_t v15 = -v14.rem;
          }
          *(&v68 + v12--) = v15 + 48;
        }
        while (v14.quot);
        CFIndex v16 = -v12;
        id v17 = (const UInt8 *)v69 + v12;
LABEL_49:
        CFStringRef v58 = CFStringCreateWithBytes(0, v17, v16, 0x8000100u, 0);
        goto LABEL_50;
      }
LABEL_46:
      v59 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 4001, *(void *)v63);
      v60 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
      [v59 handleFailureInFunction:v60 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

      v61 = &stru_1EE60E7D8;
      goto LABEL_51;
    }
    if (*(void *)v64 == 3000)
    {
      LODWORD(v67[0]) = bswap32(DWORD2(v65[0]));
      v48 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v49 = 0;
      v50 = v48 + 1;
      do
      {
        unint64_t v51 = *((unsigned __int8 *)v67 + v49);
        *(v50 - 1) = MSVFastHexStringFromBytes_hexCharacters[v51 >> 4];
        unsigned char *v50 = MSVFastHexStringFromBytes_hexCharacters[v51 & 0xF];
        v50 += 2;
        ++v49;
      }
      while (v49 != 4);
      id v24 = [NSString alloc];
      v25 = v48;
      uint64_t v26 = 8;
    }
    else
    {
      if (*(void *)v64 != 3001) {
        goto LABEL_46;
      }
      v67[0] = bswap64(*((unint64_t *)&v65[0] + 1));
      v27 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v28 = 0;
      __int16 v29 = v27 + 1;
      do
      {
        unint64_t v30 = *((unsigned __int8 *)v67 + v28);
        *(v29 - 1) = MSVFastHexStringFromBytes_hexCharacters[v30 >> 4];
        *__int16 v29 = MSVFastHexStringFromBytes_hexCharacters[v30 & 0xF];
        v29 += 2;
        ++v28;
      }
      while (v28 != 8);
      id v24 = [NSString alloc];
      v25 = v27;
      uint64_t v26 = 16;
    }
  }
  CFStringRef v58 = (CFStringRef)objc_msgSend(v24, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v25, v26, 4, 1, 4001, *(void *)v63);
LABEL_50:
  v61 = (__CFString *)v58;
LABEL_51:

  return v61;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (MRUserIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
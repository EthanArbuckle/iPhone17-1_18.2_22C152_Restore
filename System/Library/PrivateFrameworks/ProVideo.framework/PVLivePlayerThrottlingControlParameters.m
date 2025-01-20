@interface PVLivePlayerThrottlingControlParameters
+ (id)CreateControllerParameters:(id)a3 :(id)a4 :(id)a5;
- (BOOL)hasNilParameter;
- (BOOL)isEqual:(id)a3;
- (NSNumber)playerBypassRenderLink;
- (NSNumber)playerQueueSize;
- (NSNumber)renderLinkRate;
- (PVLivePlayerThrottlingControlParameters)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setPlayerBypassRenderLink:(id)a3;
- (void)setPlayerQueueSize:(id)a3;
- (void)setRenderLinkRate:(id)a3;
- (void)updateNilsFrom:(id)a3;
@end

@implementation PVLivePlayerThrottlingControlParameters

+ (id)CreateControllerParameters:(id)a3 :(id)a4 :(id)a5
{
  v7 = (NSNumber *)a3;
  v8 = (NSNumber *)a4;
  v9 = (NSNumber *)a5;
  v10 = objc_alloc_init(PVLivePlayerThrottlingControlParameters);
  renderLinkRate = v10->_renderLinkRate;
  v10->_renderLinkRate = v7;
  v12 = v7;

  playerQueueSize = v10->_playerQueueSize;
  v10->_playerQueueSize = v8;
  v14 = v8;

  playerBypassRenderLink = v10->_playerBypassRenderLink;
  v10->_playerBypassRenderLink = v9;

  return v10;
}

- (PVLivePlayerThrottlingControlParameters)init
{
  v8.receiver = self;
  v8.super_class = (Class)PVLivePlayerThrottlingControlParameters;
  v2 = [(PVLivePlayerThrottlingControlParameters *)&v8 init];
  v3 = v2;
  if (v2)
  {
    renderLinkRate = v2->_renderLinkRate;
    v2->_renderLinkRate = 0;

    playerQueueSize = v3->_playerQueueSize;
    v3->_playerQueueSize = 0;

    playerBypassRenderLink = v3->_playerBypassRenderLink;
    v3->_playerBypassRenderLink = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(PVLivePlayerThrottlingControlParameters *)self renderLinkRate];
  v5 = (void *)[v4 copy];
  v6 = [(PVLivePlayerThrottlingControlParameters *)self playerQueueSize];
  v7 = (void *)[v6 copy];
  objc_super v8 = [(PVLivePlayerThrottlingControlParameters *)self playerBypassRenderLink];
  v9 = (void *)[v8 copy];
  v10 = +[PVLivePlayerThrottlingControlParameters CreateControllerParameters:v5 :v7 :v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v7 = (PVLivePlayerThrottlingControlParameters *)a3;
  if (self == v7)
  {
    BOOL v10 = 1;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v10 = 0;
    goto LABEL_36;
  }
  objc_super v8 = v7;
  v9 = [(PVLivePlayerThrottlingControlParameters *)self renderLinkRate];
  if (v9)
  {
    v3 = [(PVLivePlayerThrottlingControlParameters *)self renderLinkRate];
    v4 = [(PVLivePlayerThrottlingControlParameters *)v8 renderLinkRate];
    if ([v3 isEqual:v4]) {
      goto LABEL_11;
    }
  }
  v11 = [(PVLivePlayerThrottlingControlParameters *)self renderLinkRate];
  if (!v11)
  {
    v11 = [(PVLivePlayerThrottlingControlParameters *)v8 renderLinkRate];
    if (!v11)
    {
LABEL_11:
      v12 = [(PVLivePlayerThrottlingControlParameters *)self playerQueueSize];
      if (v12
        && ([(PVLivePlayerThrottlingControlParameters *)self playerQueueSize],
            v23 = objc_claimAutoreleasedReturnValue(),
            [(PVLivePlayerThrottlingControlParameters *)v8 playerQueueSize],
            uint64_t v22 = objc_claimAutoreleasedReturnValue(),
            ([v23 isEqual:v22] & 1) != 0))
      {
        int v21 = 0;
      }
      else
      {
        v13 = [(PVLivePlayerThrottlingControlParameters *)self playerQueueSize];
        if (v13)
        {
          BOOL v10 = 0;
LABEL_26:

          if (!v12)
          {
LABEL_32:

            goto LABEL_33;
          }
          v17 = (void *)v22;
LABEL_31:

          goto LABEL_32;
        }
        v14 = [(PVLivePlayerThrottlingControlParameters *)v8 playerQueueSize];
        if (v14)
        {

          BOOL v10 = 0;
          goto LABEL_30;
        }
        int v21 = 1;
      }
      v15 = [(PVLivePlayerThrottlingControlParameters *)self playerBypassRenderLink];
      if (v15)
      {
        v20 = [(PVLivePlayerThrottlingControlParameters *)self playerBypassRenderLink];
        v5 = [(PVLivePlayerThrottlingControlParameters *)v8 playerBypassRenderLink];
        if ([v20 isEqual:v5])
        {
          BOOL v10 = 1;
          goto LABEL_24;
        }
      }
      v16 = [(PVLivePlayerThrottlingControlParameters *)self playerBypassRenderLink];
      if (v16)
      {

        BOOL v10 = 0;
        if (v15) {
          goto LABEL_24;
        }
      }
      else
      {
        v18 = [(PVLivePlayerThrottlingControlParameters *)v8 playerBypassRenderLink];
        BOOL v10 = v18 == 0;

        if (v15)
        {
LABEL_24:

          if (v21)
          {
LABEL_25:
            v13 = 0;
            goto LABEL_26;
          }
LABEL_30:
          v17 = (void *)v22;
          if (!v12) {
            goto LABEL_33;
          }
          goto LABEL_31;
        }
      }
      if (v21) {
        goto LABEL_25;
      }
      goto LABEL_30;
    }
  }

  BOOL v10 = 0;
LABEL_33:
  if (v9)
  {
  }
LABEL_36:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(PVLivePlayerThrottlingControlParameters *)self renderLinkRate];
  uint64_t v4 = [v3 hash];
  v5 = [(PVLivePlayerThrottlingControlParameters *)self playerQueueSize];
  uint64_t v6 = [v5 hash];
  v7 = [(PVLivePlayerThrottlingControlParameters *)self playerBypassRenderLink];
  unint64_t v8 = v6 ^ v4 ^ [v7 hash];

  return v8;
}

- (BOOL)hasNilParameter
{
  v3 = [(PVLivePlayerThrottlingControlParameters *)self renderLinkRate];
  if (v3)
  {
    uint64_t v4 = [(PVLivePlayerThrottlingControlParameters *)self playerQueueSize];
    if (v4)
    {
      v5 = [(PVLivePlayerThrottlingControlParameters *)self playerBypassRenderLink];
      BOOL v6 = v5 == 0;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)updateNilsFrom:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    uint64_t v4 = [(PVLivePlayerThrottlingControlParameters *)self renderLinkRate];

    if (!v4)
    {
      v5 = [v10 renderLinkRate];
      [(PVLivePlayerThrottlingControlParameters *)self setRenderLinkRate:v5];
    }
    BOOL v6 = [(PVLivePlayerThrottlingControlParameters *)self playerQueueSize];

    if (!v6)
    {
      v7 = [v10 playerQueueSize];
      [(PVLivePlayerThrottlingControlParameters *)self setPlayerQueueSize:v7];
    }
    unint64_t v8 = [(PVLivePlayerThrottlingControlParameters *)self playerBypassRenderLink];

    if (!v8)
    {
      v9 = [v10 playerBypassRenderLink];
      [(PVLivePlayerThrottlingControlParameters *)self setPlayerBypassRenderLink:v9];
    }
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(PVLivePlayerThrottlingControlParameters *)self renderLinkRate];
  v5 = [(PVLivePlayerThrottlingControlParameters *)self playerQueueSize];
  BOOL v6 = [(PVLivePlayerThrottlingControlParameters *)self playerBypassRenderLink];
  v7 = objc_msgSend(v3, "stringWithFormat:", @"<%p> renderLinkRate %2@ | playerQueueSize %2@ | playerBypassRenderLink %2@", self, v4, v5, v6);

  return v7;
}

- (NSNumber)renderLinkRate
{
  return self->_renderLinkRate;
}

- (void)setRenderLinkRate:(id)a3
{
}

- (NSNumber)playerQueueSize
{
  return self->_playerQueueSize;
}

- (void)setPlayerQueueSize:(id)a3
{
}

- (NSNumber)playerBypassRenderLink
{
  return self->_playerBypassRenderLink;
}

- (void)setPlayerBypassRenderLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerBypassRenderLink, 0);
  objc_storeStrong((id *)&self->_playerQueueSize, 0);

  objc_storeStrong((id *)&self->_renderLinkRate, 0);
}

@end
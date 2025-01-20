@interface MFMessageLoadingContextEvent
- (BOOL)hasLoadedBestAlternativePart;
- (BOOL)hasLoadedCompleteBody;
- (MFMailMessage)message;
- (MFMessageLoadingContext)context;
- (MFMimeBody)loadedBody;
- (MFMimePart)loadedPart;
- (NSArray)content;
- (NSError)error;
- (NSError)smimeError;
- (id)_descriptionForDebugging:(BOOL)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)transportType;
- (unint64_t)remainingBytes;
- (void)setContent:(id)a3;
- (void)setContext:(id)a3;
- (void)setError:(id)a3;
- (void)setHasLoadedBestAlternativePart:(BOOL)a3;
- (void)setHasLoadedCompleteBody:(BOOL)a3;
- (void)setLoadedBody:(id)a3;
- (void)setLoadedPart:(id)a3;
- (void)setRemainingBytes:(unint64_t)a3;
- (void)setTransportType:(int64_t)a3;
@end

@implementation MFMessageLoadingContextEvent

- (NSError)smimeError
{
  v2 = [(MFMessageLoadingContextEvent *)self loadedBody];
  v3 = [v2 topLevelPart];
  v4 = [v3 SMIMEError];

  return (NSError *)v4;
}

- (id)_descriptionForDebugging:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MFMessageLoadingContextEvent *)self context];
  v6 = [v5 message];

  v7 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v8 = objc_opt_class();
  v9 = v6;
  if (!v3)
  {
    v9 = [v6 messageID];
  }
  v10 = [v7 stringWithFormat:@"<%@: %p> message %@", v8, self, v9];
  if (!v3) {

  }
  [(MFMessageLoadingContextEvent *)self hasLoadedCompleteBody];
  v11 = NSStringFromBOOL();
  [(MFMessageLoadingContextEvent *)self hasLoadedBestAlternativePart];
  v12 = NSStringFromBOOL();
  [v10 appendFormat:@" hLCB=%@ hLBAP=%@ remainingBytes=%lu", v11, v12, -[MFMessageLoadingContextEvent remainingBytes](self, "remainingBytes")];

  if (v3)
  {
    v13 = [(MFMessageLoadingContextEvent *)self error];

    if (v13)
    {
      v14 = [(MFMessageLoadingContextEvent *)self error];
      [v10 appendFormat:@" error: %@", v14];
    }
    v15 = [(MFMessageLoadingContextEvent *)self smimeError];

    if (v15)
    {
      v16 = [(MFMessageLoadingContextEvent *)self smimeError];
      [v10 appendFormat:@" SMIME error: %@", v16];
    }
    v17 = [(MFMessageLoadingContextEvent *)self content];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      v19 = [(MFMessageLoadingContextEvent *)self content];
      [v10 appendFormat:@" content: %@", v19];
      goto LABEL_18;
    }
  }
  else
  {
    v20 = [(MFMessageLoadingContextEvent *)self error];

    if (v20)
    {
      v21 = [(MFMessageLoadingContextEvent *)self error];
      v22 = [v21 domain];
      v23 = [(MFMessageLoadingContextEvent *)self error];
      [v10 appendFormat:@" error: %@/%ld", v22, objc_msgSend(v23, "code")];
    }
    v24 = [(MFMessageLoadingContextEvent *)self smimeError];

    if (v24)
    {
      v25 = [(MFMessageLoadingContextEvent *)self smimeError];
      v26 = [v25 domain];
      v27 = [(MFMessageLoadingContextEvent *)self smimeError];
      [v10 appendFormat:@" SMIME error: %@/%ld", v26, objc_msgSend(v27, "code")];
    }
  }
  v28 = [(MFMessageLoadingContextEvent *)self content];

  if (!v28) {
    goto LABEL_19;
  }
  v19 = [(MFMessageLoadingContextEvent *)self content];
  objc_msgSend(v10, "appendFormat:", @" %lu content items", objc_msgSend(v19, "count"));
LABEL_18:

LABEL_19:
  return v10;
}

- (id)description
{
  return [(MFMessageLoadingContextEvent *)self _descriptionForDebugging:0];
}

- (id)debugDescription
{
  return [(MFMessageLoadingContextEvent *)self _descriptionForDebugging:1];
}

- (MFMailMessage)message
{
  v2 = [(MFMessageLoadingContextEvent *)self context];
  BOOL v3 = [v2 message];

  return (MFMailMessage *)v3;
}

- (MFMessageLoadingContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (MFMessageLoadingContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (NSArray)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (BOOL)hasLoadedCompleteBody
{
  return self->_hasLoadedCompleteBody;
}

- (void)setHasLoadedCompleteBody:(BOOL)a3
{
  self->_hasLoadedCompleteBody = a3;
}

- (BOOL)hasLoadedBestAlternativePart
{
  return self->_hasLoadedBestAlternativePart;
}

- (void)setHasLoadedBestAlternativePart:(BOOL)a3
{
  self->_hasLoadedBestAlternativePart = a3;
}

- (unint64_t)remainingBytes
{
  return self->_remainingBytes;
}

- (void)setRemainingBytes:(unint64_t)a3
{
  self->_remainingBytes = a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (MFMimePart)loadedPart
{
  return self->_loadedPart;
}

- (void)setLoadedPart:(id)a3
{
}

- (MFMimeBody)loadedBody
{
  return self->_loadedBody;
}

- (void)setLoadedBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedBody, 0);
  objc_storeStrong((id *)&self->_loadedPart, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end
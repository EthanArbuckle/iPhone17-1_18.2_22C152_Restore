@interface MKHTTPStatusText
+ (id)sharedInstance;
+ (id)statusText:(unint64_t)a3;
- (MKHTTPStatusText)init;
- (id)statusText:(unint64_t)a3;
@end

@implementation MKHTTPStatusText

- (MKHTTPStatusText)init
{
  v8[63] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)MKHTTPStatusText;
  v2 = [(MKHTTPStatusText *)&v6 init];
  if (v2)
  {
    v7[0] = &unk_26DF7A608;
    v7[1] = &unk_26DF7A620;
    v8[0] = @"Continue";
    v8[1] = @"Switching Protocols";
    v7[2] = &unk_26DF7A638;
    v7[3] = &unk_26DF7A650;
    v8[2] = @"Processing";
    v8[3] = @"Early Hints";
    v7[4] = &unk_26DF7A668;
    v7[5] = &unk_26DF7A680;
    v8[4] = @"OK";
    v8[5] = @"Created";
    v7[6] = &unk_26DF7A698;
    v7[7] = &unk_26DF7A6B0;
    v8[6] = @"Accepted";
    v8[7] = @"Non-Authoritative Information";
    v7[8] = &unk_26DF7A6C8;
    v7[9] = &unk_26DF7A6E0;
    v8[8] = @"No Content";
    v8[9] = @"Reset Content";
    v7[10] = &unk_26DF7A6F8;
    v7[11] = &unk_26DF7A710;
    v8[10] = @"Partial Content";
    v8[11] = @"Multi-Status";
    v7[12] = &unk_26DF7A728;
    v7[13] = &unk_26DF7A740;
    v8[12] = @"Already Reported";
    v8[13] = @"IM Used";
    v7[14] = &unk_26DF7A758;
    v7[15] = &unk_26DF7A770;
    v8[14] = @"Multiple Choices";
    v8[15] = @"Moved Permanently";
    v7[16] = &unk_26DF7A788;
    v7[17] = &unk_26DF7A7A0;
    v8[16] = @"Found";
    v8[17] = @"See Other";
    v7[18] = &unk_26DF7A7B8;
    v7[19] = &unk_26DF7A7D0;
    v8[18] = @"Not Modified";
    v8[19] = @"Use Proxy";
    v7[20] = &unk_26DF7A7E8;
    v7[21] = &unk_26DF7A800;
    v8[20] = @"Switch Proxy";
    v8[21] = @"Temporary Redirect";
    v7[22] = &unk_26DF7A818;
    v7[23] = &unk_26DF7A830;
    v8[22] = @"Permanent Redirect";
    v8[23] = @"Bad Request";
    v7[24] = &unk_26DF7A848;
    v7[25] = &unk_26DF7A860;
    v8[24] = @"Unauthorized";
    v8[25] = @"Payment Required";
    v7[26] = &unk_26DF7A878;
    v7[27] = &unk_26DF7A890;
    v8[26] = @"Forbidden";
    v8[27] = @"Not Found";
    v7[28] = &unk_26DF7A8A8;
    v7[29] = &unk_26DF7A8C0;
    v8[28] = @"Method Not Allowed";
    v8[29] = @"Not Acceptable";
    v7[30] = &unk_26DF7A8D8;
    v7[31] = &unk_26DF7A8F0;
    v8[30] = @"Proxy Authentication Required";
    v8[31] = @"Request Timeout";
    v7[32] = &unk_26DF7A908;
    v7[33] = &unk_26DF7A920;
    v8[32] = @"Conflict";
    v8[33] = @"Gone";
    v7[34] = &unk_26DF7A938;
    v7[35] = &unk_26DF7A950;
    v8[34] = @"Length Required";
    v8[35] = @"Precondition Failed";
    v7[36] = &unk_26DF7A968;
    v7[37] = &unk_26DF7A980;
    v8[36] = @"Request Entity Too Large";
    v8[37] = @"Request URI Too Long";
    v7[38] = &unk_26DF7A998;
    v7[39] = &unk_26DF7A9B0;
    v8[38] = @"Unsupported Media Type";
    v8[39] = @"Requested Range Not Satisfiable";
    v7[40] = &unk_26DF7A9C8;
    v7[41] = &unk_26DF7A9E0;
    v8[40] = @"Expectation Failed";
    v8[41] = @"I'm a teapot";
    v7[42] = &unk_26DF7A9F8;
    v7[43] = &unk_26DF7AA10;
    v8[42] = @"Misdirected Request";
    v8[43] = @"Unprocessable Entity";
    v7[44] = &unk_26DF7AA28;
    v7[45] = &unk_26DF7AA40;
    v8[44] = @"Locked";
    v8[45] = @"Failed Dependency";
    v7[46] = &unk_26DF7AA58;
    v7[47] = &unk_26DF7AA70;
    v8[46] = @"Too Early";
    v8[47] = @"Upgrade Required";
    v7[48] = &unk_26DF7AA88;
    v7[49] = &unk_26DF7AAA0;
    v8[48] = @"Precondition Required";
    v8[49] = @"Too Many Requests";
    v7[50] = &unk_26DF7AAB8;
    v7[51] = &unk_26DF7AAD0;
    v8[50] = @"Request Header Fields Too Large";
    v8[51] = @"Unavailable For Legal Reasons";
    v7[52] = &unk_26DF7AAE8;
    v7[53] = &unk_26DF7AB00;
    v8[52] = @"Internal Server Error";
    v8[53] = @"Not Implemented";
    v7[54] = &unk_26DF7AB18;
    v7[55] = &unk_26DF7AB30;
    v8[54] = @"Bad Gateway";
    v8[55] = @"Service Unavailable";
    v7[56] = &unk_26DF7AB48;
    v7[57] = &unk_26DF7AB60;
    v8[56] = @"Gateway Timeout";
    v8[57] = @"HTTP Version Not Supported";
    v7[58] = &unk_26DF7AB78;
    v7[59] = &unk_26DF7AB90;
    v8[58] = @"Variant Also Negotiates";
    v8[59] = @"Insufficient Storage";
    v7[60] = &unk_26DF7ABA8;
    v7[61] = &unk_26DF7ABC0;
    v8[60] = @"Loop Detected";
    v8[61] = @"Not Extended";
    v7[62] = &unk_26DF7ABD8;
    v8[62] = @"Network Authentication Required";
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:63];
    statusTexts = v2->_statusTexts;
    v2->_statusTexts = (NSDictionary *)v3;
  }
  return v2;
}

- (id)statusText:(unint64_t)a3
{
  statusTexts = self->_statusTexts;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSDictionary *)statusTexts objectForKey:v4];

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __34__MKHTTPStatusText_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(MKHTTPStatusText);
  return MEMORY[0x270F9A758]();
}

+ (id)statusText:(unint64_t)a3
{
  v4 = +[MKHTTPStatusText sharedInstance];
  v5 = [v4 statusText:a3];

  return v5;
}

- (void).cxx_destruct
{
}

@end
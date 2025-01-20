@interface NSString
@end

@implementation NSString

void __55__NSString_SBAdditions___isEntirelyCharactersInScript___block_invoke(void *a1)
{
  unint64_t v2 = a1[5] - 1;
  if (v2 > 7) {
    v3 = 0;
  }
  else {
    v3 = off_1E548D728[v2];
  }
  v4 = [NSString stringWithFormat:@"[%@%@]", v3, @"[:punct:][:space:]–—[:Common:][:Inherited:]"];
  _isEntirelyCharactersInScript____set = SBCopyCharacterUSetWithPattern(v4);
  if (!_isEntirelyCharactersInScript____set)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], @"NSString+SBFAdditions.m", 109, @"uset_openPattern failed to create pattern; &s",
      u_errorName(U_ZERO_ERROR));
  }
}

void __42__NSString_SBAdditions___isEntirelyCommon__block_invoke(uint64_t a1)
{
  unint64_t v2 = [NSString stringWithFormat:@"[%@]", @"[:punct:][:space:]–—[:Common:][:Inherited:]"];
  _isEntirelyCommon___charSet = SBCopyCharacterUSetWithPattern(v2);
  if (!_isEntirelyCommon___charSet)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"NSString+SBFAdditions.m", 124, @"uset_openPattern failed to create pattern; %s",
      u_errorName(U_ZERO_ERROR));
  }
}

uint64_t __47__NSString_SBAdditions__sb_emojiWithoutVS16Set__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"©®‼⁉™ℹ↔↕↖↗↘↙↩↪⌨⏏⏭⏮⏯⏱⏲⏸⏹⏺Ⓜ▪▫▶◀◻◼☀☁☂☃☄☎☑☘☝☠☢☣☦☪☮☯☸☹☺♀♂♟♠♣♥♦♨♻♾⚒⚔⚕⚖⚗⚙⚛⚜⚠⚧⚰⚱⛈⛏⛑⛓⛩⛰⛱⛴⛷⛸⛹✂✈✉✌✍✏✒✔✖✝✡✳✴❄❇❣❤➡⤴⤵⬅⬆⬇〰〽㊗㊙🅰🅱🅾🅿🈂🈷🌡🌤🌥🌦🌧🌨🌩🌪🌫🌬🌶🍽🎖🎗🎙🎚🎛🎞🎟🏋🏌🏍🏎🏔🏕🏖🏗🏘🏙🏚🏛🏜🏝🏞🏟🏳🏵🏷🐿👁📽🕉🕊🕯🕰🕳🕴🕵🕶🕷🕸🕹🖇🖊🖋🖌🖍🖐🖥🖨🖱🖲🖼🗂🗃🗄🗑🗒🗓🗜🗝🗞🗡🗣🗨🗯🗳🗺🛋🛍🛎🛏🛠🛡🛢🛣🛤🛥🛩🛰🛳"];
  uint64_t v1 = sb_emojiWithoutVS16Set___emojiWithoutVS16Set;
  sb_emojiWithoutVS16Set___emojiWithoutVS16Set = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end